-- Aaron Severance
-- buffer_list.vhd
-- Copyright (C) 2012-2015 VectorBlox Computing, Inc.

-- synthesis library stream_writer_lib
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.util_pkg.all;
use work.architecture_pkg.all;
library altera_mf;
use altera_mf.altera_mf_components.all;

entity buffer_list is
  generic (
    BUFFER_LIST_ENTRIES : positive := 8
    );
  port(

-- Global Signals --
    clk   : in std_logic;
    reset : in std_logic;

    buffer_list_full         : out std_logic;
    buffer_address_write     : in  std_logic;
    buffer_address_writedata : in  std_logic_vector(31 downto 0);
    buffer_status            : in  std_logic_vector(31 downto 0);

    current_buffer_valid         : out std_logic;
    current_buffer_address       : out std_logic_vector(31 downto 0);
    current_buffer_status        : out std_logic_vector(31 downto 0);
    current_buffer_update        : in  std_logic;
    current_buffer_update_length : in  std_logic_vector(31 downto 0);

    return_buffer_valid   : out std_logic;
    return_buffer_address : out std_logic_vector(31 downto 0);
    return_buffer_status  : out std_logic_vector(31 downto 0);
    return_buffer_read    : in  std_logic;

    available_buffers : out std_logic_vector(log2(BUFFER_LIST_ENTRIES)-1 downto 0);
    return_buffers    : out std_logic_vector(log2(BUFFER_LIST_ENTRIES)-1 downto 0)
    );
end entity buffer_list;

--This architecture just uses two FIFOs to store the buffer list; one for new
--buffers and one for returned.  Later this might be doable with a single dual
--port RAM but this is quicker to implement
architecture fifo_based of buffer_list is
  constant AVAILABLE_FIFO_DEPTH : positive := BUFFER_LIST_ENTRIES/2;
  constant RETURN_FIFO_DEPTH    : positive := BUFFER_LIST_ENTRIES/2;

  signal available_fifo_write     : std_logic;
  signal available_fifo_writedata : std_logic_vector(63 downto 0);
  signal available_fifo_read      : std_logic;
  signal available_fifo_usedw     : std_logic_vector(log2(AVAILABLE_FIFO_DEPTH)-1 downto 0);
  signal available_fifo_empty     : std_logic;
  signal available_fifo_full      : std_logic;
  signal available_fifo_readdata  : std_logic_vector(63 downto 0);

  signal return_fifo_write     : std_logic;
  signal return_fifo_writedata : std_logic_vector(63 downto 0);
  signal return_fifo_read      : std_logic;
  signal return_fifo_usedw     : std_logic_vector(log2(RETURN_FIFO_DEPTH)-1 downto 0);
  signal return_fifo_empty     : std_logic;
  signal return_fifo_full      : std_logic;
  signal return_fifo_readdata  : std_logic_vector(63 downto 0);
begin
  available_buffer_fifo : scfifo
    generic map (
      add_ram_output_register => "OFF",
      intended_device_family  => "Cyclone IV E",
      lpm_numwords            => AVAILABLE_FIFO_DEPTH,
      lpm_showahead           => "ON",
      lpm_type                => "scfifo",
      lpm_width               => 64,
      lpm_widthu              => log2(AVAILABLE_FIFO_DEPTH),
      overflow_checking       => "OFF",
      underflow_checking      => "OFF",
      use_eab                 => "OFF"
      )
    port map (
      clock => clk,
      sclr  => reset,
      wrreq => available_fifo_write,
      data  => available_fifo_writedata,
      rdreq => available_fifo_read,
      usedw => available_fifo_usedw,
      empty => available_fifo_empty,
      full  => available_fifo_full,
      q     => available_fifo_readdata
      );
  available_fifo_write                   <= buffer_address_write;
  available_fifo_writedata(63 downto 32) <= buffer_status;
  available_fifo_writedata(31 downto 0)  <= buffer_address_writedata;
  buffer_list_full                       <= available_fifo_full;
  available_buffers                      <= available_fifo_full & available_fifo_usedw;

  current_buffer_valid   <= (not available_fifo_empty) and (not return_fifo_full);
  current_buffer_address <= available_fifo_readdata(31 downto 0);
  current_buffer_status  <= available_fifo_readdata(63 downto 32);

  available_fifo_read        <= current_buffer_update and (not return_fifo_full);

  return_buffer_fifo : scfifo
    generic map (
      add_ram_output_register => "OFF",
      intended_device_family  => "Cyclone IV E",
      lpm_numwords            => RETURN_FIFO_DEPTH,
      lpm_showahead           => "ON",
      lpm_type                => "scfifo",
      lpm_width               => 64,
      lpm_widthu              => log2(RETURN_FIFO_DEPTH),
      overflow_checking       => "OFF",
      underflow_checking      => "OFF",
      use_eab                 => "OFF"
      )
    port map (
      clock => clk,
      sclr  => reset,
      wrreq => return_fifo_write,
      data  => return_fifo_writedata,
      rdreq => return_fifo_read,
      usedw => return_fifo_usedw,
      empty => return_fifo_empty,
      full  => return_fifo_full,
      q     => return_fifo_readdata
      );
  return_fifo_write                   <= available_fifo_read;
  return_fifo_writedata(63 downto 32) <= current_buffer_update_length;
  return_fifo_writedata(31 downto 0)  <= available_fifo_readdata(31 downto 0);
  return_fifo_read                    <= return_buffer_read;
  return_buffers                      <= return_fifo_full & return_fifo_usedw;
  return_buffer_valid                 <= not return_fifo_empty;
  return_buffer_status                <= return_fifo_readdata(63 downto 32);
  return_buffer_address               <= return_fifo_readdata(31 downto 0);

  assert BUFFER_LIST_ENTRIES >= 8
    report "Parameter BUFFER_LIST_ENTRIES must be greater than or equal to 8 because of FIFO restrictions"
    severity error;

end architecture fifo_based;

