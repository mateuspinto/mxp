-- Aaron Severance
-- stream_writer.vhd
-- Copyright (C) 2012-2015 VectorBlox Computing, Inc.

-- synthesis library stream_writer_lib
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.util_pkg.all;
use work.architecture_pkg.all;
use work.component_pkg.all;
library altera_mf;
use altera_mf.altera_mf_components.all;


entity stream_writer is
  generic (
    STREAM_DATA_WIDTH_BITS     : positive := 32;
    MEMORY_DATA_WIDTH_BYTES    : positive := 4;
    LOG2_MEMORY_BURST_BEATS    : natural  := 3;
    BUFFER_LIST_ENTRIES        : positive := 8;
    CAPTURE_STARTOFPACKET_DATA : natural  := 0
    );
  port(

-- Global Signals --
    clk   : in std_logic;
    reset : in std_logic;

    interrupt : out std_logic;

-- Avalon MM Slave (Registers) --
    slave_waitrequest : out std_logic;
    slave_address     : in  std_logic_vector(log2(SLAVE_REGISTERS)-1 downto 0);
    slave_read        : in  std_logic;
    slave_write       : in  std_logic;
    slave_writedata   : in  std_logic_vector(31 downto 0);

    slave_readdatavalid : out std_logic;
    slave_readdata      : out std_logic_vector(31 downto 0);

-- Avalon Streaming Sink (Data In) --
    sink_valid         : in std_logic;
    sink_startofpacket : in std_logic;
    sink_endofpacket   : in std_logic;
    sink_data          : in std_logic_vector(STREAM_DATA_WIDTH_BITS-1 downto 0);

    sink_ready : out std_logic;

-- Avalon MM Master (Writer) --
    master_waitrequest : in  std_logic;
    master_burstcount  : out std_logic_vector(LOG2_MEMORY_BURST_BEATS downto 0);
    master_address     : out std_logic_vector(31 downto 0);
    master_write       : out std_logic;
    master_writedata   : out std_logic_vector(MEMORY_DATA_WIDTH_BYTES*8-1 downto 0);
    master_byteenable  : out std_logic_vector(MEMORY_DATA_WIDTH_BYTES-1 downto 0)
    );
end entity stream_writer;

architecture rtl of stream_writer is
  constant MEMORY_BURST_BEATS             : positive := 2**LOG2_MEMORY_BURST_BEATS;
  constant BURST_SIZE_BYTES               : positive := MEMORY_BURST_BEATS*MEMORY_DATA_WIDTH_BYTES;
  constant STREAM_DATA_WIDTH_BYTES        : positive := (STREAM_DATA_WIDTH_BITS+7)/8;
  constant STREAM_DATA_WIDTH_PADDED_BYTES : positive := 2**(log2(STREAM_DATA_WIDTH_BYTES));
  constant STREAM_DATA_WIDTH_PADDED_BITS  : positive := STREAM_DATA_WIDTH_PADDED_BYTES*8;
  constant MEMORY_DATA_WIDTH_BITS         : positive := MEMORY_DATA_WIDTH_BYTES*8;
  constant SINK_WORDS                     : positive := MEMORY_DATA_WIDTH_BYTES/STREAM_DATA_WIDTH_PADDED_BYTES;
  constant DATA_FIFO_DEPTH                : positive := intmax(8, 2*MEMORY_BURST_BEATS);
  constant DATA_FIFO_WIDTH                : positive := 1+1+STREAM_DATA_WIDTH_BITS*SINK_WORDS;

  signal buffer_list_full         : std_logic;
  signal buffer_address_write     : std_logic;
  signal buffer_address_writedata : std_logic_vector(31 downto 0);
  signal buffer_status            : std_logic_vector(31 downto 0);

  signal current_buffer_valid         : std_logic;
  signal current_buffer_address       : std_logic_vector(31 downto 0);
  signal current_buffer_status        : std_logic_vector(31 downto 0);
  signal current_buffer_update        : std_logic;
  signal current_buffer_update_length : std_logic_vector(31 downto 0);

  signal return_buffer_valid       : std_logic;
  signal return_buffer_address     : std_logic_vector(31 downto 0);
  signal return_buffer_address_reg : std_logic_vector(31 downto 0);
  signal return_buffer_status      : std_logic_vector(31 downto 0);
  signal return_buffer_read        : std_logic;

  signal available_buffers : std_logic_vector(log2(BUFFER_LIST_ENTRIES)-1 downto 0);
  signal return_buffers    : std_logic_vector(log2(BUFFER_LIST_ENTRIES)-1 downto 0);

  type   register_file_type is array (natural range <>) of std_logic_vector(31 downto 0);
  signal register_file      : register_file_type(SLAVE_REGISTERS-1 downto 0);
  signal buffer_list_status : std_logic_vector(31 downto 0);

  signal current_sink_word         : unsigned(log2(SINK_WORDS) downto 0);
  signal last_sink_word            : std_logic;
  signal last_sink_word_d1         : std_logic;
  type   sink_data_array is array (natural range <>) of std_logic_vector(STREAM_DATA_WIDTH_BITS-1 downto 0);
  signal sink_buffer_data_2d       : sink_data_array(SINK_WORDS-1 downto 0);
  signal sink_buffer_data          : std_logic_vector((STREAM_DATA_WIDTH_BITS*SINK_WORDS)-1 downto 0);
  signal sink_buffer_startofpacket : std_logic;
  signal sink_buffer_endofpacket   : std_logic;

  signal data_fifo_read         : std_logic;
  signal data_fifo_write        : std_logic;
  signal data_fifo_writedata    : std_logic_vector(DATA_FIFO_WIDTH-1 downto 0);
  signal data_fifo_almost_full  : std_logic;
  signal data_fifo_usedw        : std_logic_vector(log2(DATA_FIFO_DEPTH)-1 downto 0);
  signal data_fifo_head_invalid : std_logic;
  signal data_fifo_empty        : std_logic;
  signal data_fifo_full         : std_logic;
  signal data_fifo_readdata     : std_logic_vector(DATA_FIFO_WIDTH-1 downto 0);

  signal data_fifo_readstartofpacket : std_logic;
  signal data_fifo_readendofpacket   : std_logic;
  signal data_fifo_write_endofpacket : std_logic;
  signal data_fifo_read_endofpacket  : std_logic;
  signal data_fifo_usedendofpackets  : unsigned(log2(DATA_FIFO_DEPTH) downto 0);

  signal current_buffer_length          : unsigned(STATUS_LENGTH_LENGTH-1 downto 0);
  signal current_written_length         : unsigned(STATUS_LENGTH_LENGTH-1 downto 0);
  signal current_had_startofpacket      : std_logic;
  signal current_had_endofpacket        : std_logic;
  signal current_had_backpressure       : std_logic;
  signal current_wait_for_startofpacket : std_logic;
  signal interrupt_after_current        : std_logic;

  type   writer_state_type is (NO_BUFFER, WAIT_FOR_STARTOFPACKET, WRITE_DATA);
  signal writer_state : writer_state_type;

  signal master_write_s   : std_logic;
  signal master_address_s : unsigned(31 downto 0);

  signal last_write          : std_logic;
  signal last_write_of_burst : std_logic;
  signal burst_available     : std_logic;
  signal bursting            : std_logic;
  signal internal_burstcount : unsigned(master_burstcount'range);
begin
  register_file(REG_NEXT_STATUS_LENGTH)   <= buffer_status;
  register_file(REG_NEXT_ADDRESS)         <= (others => '-');  --write only
  register_file(REG_RETURN_STATUS_LENGTH) <=
    return_buffer_status when return_buffer_valid = '1' else (others => '0');
  register_file(REG_RETURN_ADDRESS)     <= return_buffer_address_reg;
  register_file(REG_BUFFER_LIST_STATUS) <= buffer_list_status;

  interrupt <= return_buffer_status(STATUS_INTERRUPT_BIT) when return_buffer_valid = '1' else '0';

  buffer_list_status(31)                                     <= buffer_list_full;
  buffer_list_status(30 downto 16)                           <= (others => '0');
  buffer_list_status(15 downto 8+log2(buffer_list_entries))  <= (others => '0');
  buffer_list_status(8+log2(buffer_list_entries)-1 downto 8) <= available_buffers;
  buffer_list_status(7 downto log2(buffer_list_entries))     <= (others => '0');
  buffer_list_status(log2(buffer_list_entries)-1 downto 0)   <= return_buffers;

  --buffer length/status register (which is sticky) and register return address
  --when return status is read
  process (clk)
  begin  -- process
    if clk'event and clk = '1' then     -- rising clock edge
      if (slave_write = '1' and
          slave_address = std_logic_vector(to_unsigned(REG_NEXT_STATUS_LENGTH, slave_address'length))) then
        buffer_status <= slave_writedata;
      end if;

      if return_buffer_read = '1' then
        return_buffer_address_reg <= return_buffer_address;
      end if;

      if reset = '1' then               -- synchronous reset (active high)
        buffer_status             <= (others => '0');
        return_buffer_address_reg <= (others => '0');
      end if;
    end if;
  end process;

  return_buffer_read <=
    (slave_read and
     return_buffer_valid) when (slave_address =
                                std_logic_vector(to_unsigned(REG_RETURN_STATUS_LENGTH, slave_address'length)))
    else '0';

  buffer_address_write <=
    slave_write when (slave_address =
                      std_logic_vector(to_unsigned(REG_NEXT_ADDRESS, slave_address'length)))
    else '0';
  buffer_address_writedata <= slave_writedata;

  --hrm, need to block on this but don't want to block when buffer list is full
  --so that entries can be read out of the head.  so for now output not
  --registered...
  slave_waitrequest <= slave_write and buffer_list_full;

  --register readdata for timing; could be optimized to a static 1 cycle delay
  --instead of using readdatavalid signal
  process (clk)
  begin  -- process
    if clk'event and clk = '1' then     -- rising clock edge
      slave_readdata      <= register_file(to_integer(unsigned(slave_address)));
      slave_readdatavalid <= slave_read;

      if reset = '1' then               -- synchronous reset (active high)
        slave_readdatavalid <= '0';
      end if;
    end if;
  end process;

  --buffer list.  stores buffers to write and return buffers
  the_buffer_list : component buffer_list
    generic map (
      buffer_list_entries => buffer_list_entries
      )
    port map (
      clk   => clk,
      reset => reset,

      buffer_list_full         => buffer_list_full,
      buffer_address_write     => buffer_address_write,
      buffer_address_writedata => buffer_address_writedata,
      buffer_status            => buffer_status,

      current_buffer_valid         => current_buffer_valid,
      current_buffer_address       => current_buffer_address,
      current_buffer_status        => current_buffer_status,
      current_buffer_update        => current_buffer_update,
      current_buffer_update_length => current_buffer_update_length,

      return_buffer_valid   => return_buffer_valid,
      return_buffer_address => return_buffer_address,
      return_buffer_status  => return_buffer_status,
      return_buffer_read    => return_buffer_read,

      available_buffers => available_buffers,
      return_buffers    => return_buffers
      );
  current_wait_for_startofpacket <= current_buffer_status(STATUS_STARTOFPACKET_BIT);
  interrupt_after_current        <= current_buffer_status(STATUS_INTERRUPT_BIT);
  current_buffer_length          <= unsigned(current_buffer_status(current_buffer_length'range));

  current_buffer_update_length(STATUS_STARTOFPACKET_BIT) <= current_had_startofpacket;
  current_buffer_update_length(STATUS_ENDOFPACKET_BIT)   <= current_had_endofpacket or
                                                            data_fifo_readendofpacket;
  current_buffer_update_length(STATUS_BACKPRESSURE_BIT)                           <= current_had_backpressure;
  current_buffer_update_length(STATUS_INTERRUPT_BIT)                              <= interrupt_after_current;
  current_buffer_update_length(STATUS_RESERVED_LEFT downto STATUS_RESERVED_RIGHT) <= (others => '0');
  current_buffer_update_length(STATUS_LENGTH_LEFT downto STATUS_LENGTH_RIGHT)     <=
    std_logic_vector(current_written_length);

  last_sink_word <=
    sink_valid when ((current_sink_word = to_unsigned(SINK_WORDS-1, current_sink_word'length) and
                      (CAPTURE_STARTOFPACKET_DATA /= 0 or sink_startofpacket = '0')) or
                     sink_endofpacket = '1')
    else '0';

  --buffer incoming data.  may have bad alignment if valid comes in between
  --endofpacket and startofpacket signals, not clear if this is possible from
  --avalon interface specs.
  process (clk)
  begin  -- process
    if clk'event and clk = '1' then     -- rising clock edge
      last_sink_word_d1 <= last_sink_word;

      if last_sink_word_d1 = '1' then
        sink_buffer_startofpacket <= '0';
        sink_buffer_endofpacket   <= '0';
      end if;

      if sink_valid = '1' then
        if sink_startofpacket = '1' then
          sink_buffer_startofpacket <= '1';
        end if;
        if sink_endofpacket = '1' then
          sink_buffer_endofpacket <= '1';
        end if;

        if CAPTURE_STARTOFPACKET_DATA /= 0 or sink_startofpacket = '0' then
          sink_buffer_data_2d(to_integer(current_sink_word)) <= sink_data;
          if last_sink_word = '1' then
            current_sink_word <= to_unsigned(0, current_sink_word'length);
          else
            current_sink_word <= current_sink_word + to_unsigned(1, current_sink_word'length);
          end if;
        end if;
      end if;

      --track how many end of packet signals are in the fifo (probably
      --overkill, but should work)
      if data_fifo_write_endofpacket = '1' and data_fifo_readendofpacket = '0' then
        data_fifo_usedendofpackets <= data_fifo_usedendofpackets + to_unsigned(1, data_fifo_usedendofpackets'length);
      elsif data_fifo_read_endofpacket = '1' and data_fifo_write_endofpacket = '0' then
        data_fifo_usedendofpackets <= data_fifo_usedendofpackets - to_unsigned(1, data_fifo_usedendofpackets'length);
      end if;

      if reset = '1' then               -- synchronous reset (active high)
        sink_buffer_startofpacket  <= '0';
        sink_buffer_endofpacket    <= '0';
        current_sink_word          <= to_unsigned(0, current_sink_word'length);
        data_fifo_usedendofpackets <= to_unsigned(0, data_fifo_usedendofpackets'length);
      end if;
    end if;
  end process;
  data_fifo_write_endofpacket <= data_fifo_write and sink_buffer_endofpacket;
  data_fifo_read_endofpacket  <= data_fifo_read and data_fifo_readendofpacket;

  sink_expand_gen : for gword in SINK_WORDS-1 downto 0 generate
    sink_buffer_data((STREAM_DATA_WIDTH_BITS*(gword+1))-1 downto STREAM_DATA_WIDTH_BITS*gword) <= sink_buffer_data_2d(gword);

    --if stream data width is not a power of 2, this pads to the correct data width
    master_writedata((STREAM_DATA_WIDTH_PADDED_BITS*(gword+1))-1 downto STREAM_DATA_WIDTH_PADDED_BITS*gword) <=
      std_logic_vector(resize(unsigned(data_fifo_readdata((STREAM_DATA_WIDTH_BITS*(gword+1))-1 downto
                                                          STREAM_DATA_WIDTH_BITS*gword)),
                              STREAM_DATA_WIDTH_PADDED_BITS));
  end generate sink_expand_gen;

  data_fifo : fwft_fifo_reg
    generic map (
      WIDTH             => DATA_FIFO_WIDTH,
      DEPTH             => DATA_FIFO_DEPTH,
      ALMOST_FULL_VALUE => DATA_FIFO_DEPTH-2,  --FIXME: Check if can be -1
      EXTERNAL_REGISTER => false
      )
    port map (
      clk   => clk,
      reset => reset,

      rdreq     => data_fifo_read,
      wrreq     => data_fifo_write,
      writedata => data_fifo_writedata,

      almost_full  => data_fifo_almost_full,
      usedw        => data_fifo_usedw,
      head_invalid => data_fifo_head_invalid,
      empty        => data_fifo_empty,
      full         => data_fifo_full,
      readdata     => data_fifo_readdata
      );
  data_fifo_write     <= last_sink_word_d1;
  data_fifo_writedata <= sink_buffer_startofpacket & sink_buffer_endofpacket & sink_buffer_data;
  data_fifo_read      <=
    (not data_fifo_head_invalid) when ((writer_state = WAIT_FOR_STARTOFPACKET and
                                        data_fifo_readstartofpacket = '0') or
                                       (master_write_s = '1' and master_waitrequest = '0' and
                                        (data_fifo_readendofpacket = '0' or last_write = '1')))
    else '0';

  data_fifo_readstartofpacket <= data_fifo_readdata(data_fifo_readdata'left);
  data_fifo_readendofpacket   <= data_fifo_readdata(data_fifo_readdata'left-1);

  --always burst, always write all bytes
  master_burstcount <= std_logic_vector(to_unsigned(MEMORY_BURST_BEATS, master_burstcount'length));
  master_byteenable <= (others => '1');

  
  burst_available <= '1' when (data_fifo_head_invalid = '0' and
                               (unsigned(data_fifo_usedw) >= to_unsigned(MEMORY_BURST_BEATS, data_fifo_usedw'length) or
                                data_fifo_full = '1' or
                                data_fifo_usedendofpackets /= to_unsigned(0, data_fifo_usedendofpackets'length)))
                     else '0';

  --stall a cycle in advance to allow a ready latency of 1
  sink_ready <= not data_fifo_almost_full;

  master_write_s <= (not data_fifo_head_invalid) and (burst_available or bursting) when writer_state = WRITE_DATA
                    else '0';
  master_write        <= master_write_s;
  last_write_of_burst <=
    master_write_s when internal_burstcount = to_unsigned(MEMORY_BURST_BEATS-1, internal_burstcount'length)
    else '0';
  last_write <= last_write_of_burst when (data_fifo_readendofpacket = '1' or
                                          current_written_length >= current_buffer_length)
                else '0';

  --Keep track of current address & burst cycle
  process (clk)
  begin  -- process
    if clk'event and clk = '1' then     -- rising clock edge
      if data_fifo_almost_full = '1' then
        current_had_backpressure <= '1';
      end if;

      if master_write_s = '1' then
        if data_fifo_readstartofpacket = '1' then
          current_had_startofpacket <= '1';
        end if;
        if data_fifo_readendofpacket = '1' then
          current_had_endofpacket <= '1';
        end if;

        if bursting = '0' then
          current_written_length <=
            current_written_length + to_unsigned(BURST_SIZE_BYTES, current_written_length'length);
        end if;

        if last_write_of_burst = '1' and master_waitrequest = '0' then
          bursting         <= '0';
          master_address_s <= master_address_s + to_unsigned(BURST_SIZE_BYTES, master_address_s'length);
        elsif master_write_s = '1' then
          bursting <= '1';
        end if;
      end if;

      if master_write_s = '1' and master_waitrequest = '0' then
        if last_write_of_burst = '1' then
          internal_burstcount <= to_unsigned(0, internal_burstcount'length);
        else
          internal_burstcount <= internal_burstcount + to_unsigned(1, internal_burstcount'length);
        end if;
      end if;

      case writer_state is
        when NO_BUFFER =>
          current_written_length <= to_unsigned(0, current_written_length'length);

          if current_buffer_valid = '1' then
            master_address_s <= unsigned(current_buffer_address);
            if current_wait_for_startofpacket = '1' then
              writer_state <= WAIT_FOR_STARTOFPACKET;
            else
              writer_state <= WRITE_DATA;
            end if;
          end if;
        when WAIT_FOR_STARTOFPACKET =>
          if data_fifo_readstartofpacket = '1' then
            writer_state <= WRITE_DATA;
          end if;
        when WRITE_DATA =>
          if last_write = '1' and master_waitrequest = '0' then
            writer_state              <= NO_BUFFER;
            current_had_backpressure  <= '0';
            current_had_endofpacket   <= '0';
            current_had_startofpacket <= '0';
          end if;
        when others =>
          writer_state <= NO_BUFFER;
      end case;

      if reset = '1' then               -- synchronous reset (active high)
        internal_burstcount       <= to_unsigned(0, internal_burstcount'length);
        master_address_s          <= to_unsigned(0, master_address_s'length);
        writer_state              <= NO_BUFFER;
        bursting                  <= '0';
        current_had_endofpacket   <= '0';
        current_had_startofpacket <= '0';
        current_had_backpressure  <= '0';
      end if;
    end if;
  end process;
  master_address        <= std_logic_vector(master_address_s);
  current_buffer_update <= last_write and (not master_waitrequest);

end architecture rtl;

