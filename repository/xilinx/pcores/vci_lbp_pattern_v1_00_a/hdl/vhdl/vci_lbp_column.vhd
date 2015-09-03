-- vci_lbp_column.vhd
-- Copyright (C) 2014 VectorBlox Computing, Inc.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;

entity vci_lbp_column is
  generic (
    VCI_LANES : positive := 2
    -- to produce valid results must be >= 2 lanes
    -- lanes * 4 bytes / lane * 2 wavefronts >= 12 cells (for block size of 4)
    -- lanes * 2 >= 3
    -- min VCI_LANES = 2

    -- to produce full wavefront need:
    -- lanes * 4 bytes / lane * 2 wavefronts >= lanes * 4 bytes / lane + 11 extra cells (for block size of 4)
    -- lanes * 2 >= lanes + 3  
    -- min VCI_LANES = 4

    -- 6, 10(+4), 17(+11)
    );
  port (
    vci_clk   : in std_logic;
    vci_reset : in std_logic;

    vci_valid  : in std_logic_vector(2 downto 0);
    vci_signed : in std_logic;
    vci_opsize : in std_logic_vector(1 downto 0);

    vci_vector_start : in std_logic;
    vci_vector_end   : in std_logic;
    vci_byte_valid   : in std_logic_vector(VCI_LANES*4-1 downto 0);

    vci_data_a : in std_logic_vector(VCI_LANES*32-1 downto 0);
    vci_flag_a : in std_logic_vector(VCI_LANES*4-1 downto 0);
    vci_data_b : in std_logic_vector(VCI_LANES*32-1 downto 0);
    vci_flag_b : in std_logic_vector(VCI_LANES*4-1 downto 0);

    vci_dest_addr_in  :  in std_logic_vector(31 downto 0);
    vci_dest_addr_out : out std_logic_vector(31 downto 0);

    vci_data_out      : out std_logic_vector(VCI_LANES*32-1 downto 0);
    vci_flag_out      : out std_logic_vector(VCI_LANES*4-1 downto 0);
    vci_byteenable    : out std_logic_vector(VCI_LANES*4-1 downto 0)
    );
end;

architecture rtl of vci_lbp_column is

  constant NON_GATED_STAGES     : positive := 2;
  constant BLOCK_1_GATED_STAGES : positive := 4;
  constant BLOCK_2_GATED_STAGES : positive := 8;
  constant BLOCK_4_GATED_STAGES : positive := 15;
  constant MAX_GATED_STAGES     : positive := BLOCK_4_GATED_STAGES;

  signal flush : std_logic;
  signal clk_en : std_logic;
  signal mode : std_logic_vector(2 downto 0);

  signal warmed_up : std_logic;
  signal warm_up_countdown : integer;
  signal warm_up_stages : positive := BLOCK_1_GATED_STAGES;

  --byte enable and flag shifters
  type byteena_out_shifter_type is array (natural range <>) of std_logic_vector((VCI_LANES*4)-1 downto 0);
  type dest_addr_shifter_type is array (natural range <>) of std_logic_vector(31 downto 0);

  signal flag_out_shifter    : byteena_out_shifter_type(NON_GATED_STAGES-1 downto 0);
  signal byteena_out_shifter : byteena_out_shifter_type(NON_GATED_STAGES-1 downto 0);
  signal dest_addr_shifter   : dest_addr_shifter_type(NON_GATED_STAGES-1 downto 0);

  signal flag_out_gated_shifter    : byteena_out_shifter_type(MAX_GATED_STAGES-1 downto 0);
  signal byteena_out_gated_shifter : byteena_out_shifter_type(MAX_GATED_STAGES-1 downto 0);
  signal dest_addr_gated_shifter   : dest_addr_shifter_type(MAX_GATED_STAGES-1 downto 0);

  --Output & Intermediates
  -- single wavefront
  signal data_out      : std_logic_vector((VCI_LANES*32)-1 downto 0);
  -- double wavefront
  signal next_in       : std_logic_vector((2*VCI_LANES*32)-1 downto 0);
  -- two wavefronts, double precision
  signal row           : std_logic_vector((2*2*VCI_LANES*32)-1 downto 0);
  signal double_row    : std_logic_vector((2*2*VCI_LANES*32)-1 downto 0);
  signal quadruple_row : std_logic_vector((2*2*VCI_LANES*32)-1 downto 0);
  -- single wavefront, double precision
  signal center        : std_logic_vector((2*VCI_LANES*32)-1 downto 0);

  --Unpacked
  type  byte_array is array (natural range <>) of std_logic_vector(7 downto 0);
  type  half_array is array (natural range <>) of std_logic_vector(15 downto 0);

  -- single wavefront of bytes
  signal data_out_byte   : byte_array((VCI_LANES*4)-1 downto 0);
  -- double wavefront of bytes
  signal next_byte       : byte_array((2*VCI_LANES*4)-1 downto 0);

  -- double wavefront of halves
  signal row_half           : half_array((2*VCI_LANES*4)-1 downto 0);
  signal double_row_half    : half_array((2*VCI_LANES*4)-1 downto 0);
  signal quadruple_row_half : half_array((2*VCI_LANES*4)-1 downto 0);
  -- single wavefront of halves
  signal center_half        : half_array((VCI_LANES*4)-1 downto 0);

  --2D Intermediates 
  type input_array is array (natural range <>) of std_logic_vector((2*VCI_LANES*32)-1 downto 0);
  type double_input_array is array (natural range <>) of std_logic_vector((2*2*VCI_LANES*32)-1 downto 0);
  -- double wavefront of bytes
  signal previous : input_array(4 downto 0);
  -- single wavefront of halves
  signal neighbor : input_array(7 downto 0);
  -- double wavefront of halves
  signal reduced  : double_input_array(8 downto 0);

  --Unpacked
  type byte_array_2D is array (natural range <>, natural range <>) of std_logic_vector(7 downto 0);
  type half_array_2D is array (natural range <>, natural range <>) of std_logic_vector(15 downto 0);
  -- double wavefront of bytes
  signal previous_byte  : byte_array_2D(4 downto 0, (2*VCI_LANES*4)-1 downto 0);
  -- single wavefront of halves
  signal neighbor_half  : half_array_2D(7 downto 0, (VCI_LANES*4)-1 downto 0);
  -- double wavefront of halves
  signal reduced_half   : half_array_2D(8 downto 0, (2*VCI_LANES*4)-1 downto 0);

begin

  --Change data interally to arrays of bytes/halves for ease of use

  --Output (single wavefront of bytes)
  pack_out_gen : for i in (VCI_LANES*4)-1 downto 0 generate
    data_out(((i+1)*8)-1 downto i*8) <= std_logic_vector(data_out_byte(i));
  end generate pack_out_gen;

  --Rows (double wavefront of halves)
  unpack_row_gen : for i in (2*VCI_LANES*4)-1 downto 0 generate
    next_byte(i)       <= next_in((i+1)*8-1 downto i*8);
    row((i+1)*16-1 downto i*16) <= std_logic_vector(row_half(i));
    double_row((i+1)*16-1 downto i*16) <= std_logic_vector(double_row_half(i));
    quadruple_row((i+1)*16-1 downto i*16) <= std_logic_vector(quadruple_row_half(i));
  end generate unpack_row_gen;

  --Reduced row (double wavefront of halves)
  unpack_reduced_gen : for i in (2*VCI_LANES*4)-1 downto 0 generate
    repeat_9_gen : for m in 8 downto 0 generate
      reduced_half(m, i) <= reduced(m)((i+1)*16-1 downto i*16);
    end generate repeat_9_gen;
  end generate unpack_reduced_gen;

  --Previous input (double wavefront of bytes)
  unpack_previous_gen : for i in (2*VCI_LANES*4)-1 downto 0 generate
    repeat_4_gen : for m in 4 downto 0 generate
      previous_byte(m, i) <= previous(m)((i+1)*8-1 downto i*8);
    end generate repeat_4_gen;
  end generate unpack_previous_gen;

  --LBP blocks(single wavefront of halves)
  unpack_neighbor_gen : for i in (VCI_LANES*4)-1 downto 0 generate
    repeat_8_gen : for m in 7 downto 0 generate
      neighbor_half(m, i) <= neighbor(m)((i+1)*16-1 downto i*16);
    end generate repeat_8_gen;
    center_half(i) <= center((i+1)*16-1 downto i*16);
  end generate unpack_neighbor_gen;

  next_in <= vci_data_b & vci_data_a;
  clk_en <= vci_valid(2) or vci_valid(1) or vci_valid(0);
  warmed_up <= not vci_vector_start when warm_up_countdown = 0 else '0';

  process (vci_clk)
  begin
    if vci_clk'event and vci_clk = '1' then 
      if clk_en = '1' then
        if vci_vector_start = '1' then

          mode <= vci_valid;

          if vci_valid = "001" then
            warm_up_stages    <= BLOCK_1_GATED_STAGES - 1;
            warm_up_countdown <= BLOCK_1_GATED_STAGES - 1;
          elsif vci_valid = "010" then
            warm_up_stages    <= BLOCK_2_GATED_STAGES - 1;
            warm_up_countdown <= BLOCK_2_GATED_STAGES - 1;
          elsif vci_valid = "100" then
            warm_up_stages    <= BLOCK_4_GATED_STAGES - 1;
            warm_up_countdown <= BLOCK_4_GATED_STAGES - 1;
          end if;

        elsif warmed_up = '0' then
          warm_up_countdown <= warm_up_countdown - 1;
        end if;
      end if;
    end if;
  end process;

  -- gated - keep previous input
  process (vci_clk)
  begin
    if vci_clk'event and vci_clk = '1' then 
      if clk_en = '1' then
        previous(0) <= next_in;
      end if;
    end if;
  end process;

  previous_gen: for m in 2 downto 0 generate
    process (vci_clk)
    begin
      if vci_clk'event and vci_clk = '1' then 
        if clk_en = '1' then
          if vci_vector_start = '1' then
            previous(m+1) <= (others => '0');
          else
            previous(m+1) <= previous(m);
          end if;
        end if;
      end if;
    end process;
  end generate previous_gen; --cycles 0, 1, 2, 3

  -- gated - rolling accumulate of input rows (single wavefront + 8 + 2 + 1)
  row_gen: for i in (VCI_LANES*4)+11-1 downto 0 generate
    process (vci_clk)
      variable urow : unsigned(15 downto 0);
      variable unext : unsigned(7 downto 0);
      variable uprevious : unsigned(7 downto 0);
    begin
      if vci_clk'event and vci_clk = '1' then 
        -- if vci_valid /= "000" or (vci_valid = "000" and flush = '1') then
        if clk_en = '1' then
          unext := unsigned(next_byte(i));

          if vci_vector_start = '1' then
            urow := (others => '0');
            uprevious := (others => '0');
          else
            urow := unsigned(row_half(i));
            if mode = "001" then
              uprevious := unsigned(previous_byte(0,i)); --ready on valid cycle 1
            elsif mode = "010" then
              uprevious := unsigned(previous_byte(1,i)); --ready on valid cycle 2
            elsif mode = "100" then
              uprevious := unsigned(previous_byte(3,i)); --ready on valid cycle 4
            end if;
          end if;

          row_half(i) <= std_logic_vector(urow + unext - uprevious);
        end if;
      end if;
    end process;
  end generate row_gen;

  -- column-wise doubling (single wavefront + 8 + 2)
  double_row_gen: for i in (VCI_LANES*4)+10-1 downto 0 generate
    process (vci_clk)
    begin
      if vci_clk'event and vci_clk = '1' then 
        if clk_en = '1' then
          double_row_half(i) <= std_logic_vector(unsigned(row_half(i)) + unsigned(row_half(i+1))); --valid on cycle 3 or cycle 5
        end if;
      end if;
    end process;
  end generate double_row_gen;

  -- column-wise quadrupling (single wavefront + 8)
  quadruple_gen: for i in (VCI_LANES*4)+8-1 downto 0 generate
    process (vci_clk)
    begin
      if vci_clk'event and vci_clk = '1' then 
        if clk_en = '1' then
          quadruple_row_half(i) <= std_logic_vector(unsigned(double_row_half(i)) + unsigned(double_row_half(i+2))); -- valid on cycle 6
        end if;
      end if;
    end process;
  end generate quadruple_gen;

  -- gated reduced
  process (vci_clk)
  begin
    if vci_clk'event and vci_clk = '1' then 
      if clk_en = '1' then
        if mode = "001" then
          reduced(0) <= row; -- valid on cycle 2
        elsif mode = "010" then
          reduced(0) <= double_row; -- valid on cycle 4
        elsif mode = "100" then
          reduced(0) <= quadruple_row; -- valid on cycle 7
        end if;
      end if;
    end if;
  end process;

  reduced_gen: for i in 7 downto 0 generate
    process (vci_clk)
    begin
      if vci_clk'event and vci_clk = '1' then 
        if clk_en = '1' then
          reduced(i+1) <= reduced(i); --001 = cycles 3, 4, 010 = cycles 5, 6, 7, 8, 100 = cycles 8, 9, 10, 11, 12, 13, 14, 15
        end if;
      end if;
    end process;
  end generate reduced_gen;

  -- select neighbor and center blocks (single wavefront)
  process (vci_clk)
  begin
    if vci_clk'event and vci_clk = '1' then  -- rising clock edge
      if mode = "001" then -- cycle 5
        neighbor(7) <= reduced(1*2)(((2*VCI_LANES*32)+(1*0*16))-1 downto (1*0*16));
        neighbor(6) <= reduced(1*2)(((2*VCI_LANES*32)+(1*1*16))-1 downto (1*1*16));
        neighbor(5) <= reduced(1*2)(((2*VCI_LANES*32)+(1*2*16))-1 downto (1*2*16));
        neighbor(4) <= reduced(1*1)(((2*VCI_LANES*32)+(1*2*16))-1 downto (1*2*16));
        neighbor(3) <= reduced(1*0)(((2*VCI_LANES*32)+(1*2*16))-1 downto (1*2*16));
        neighbor(2) <= reduced(1*0)(((2*VCI_LANES*32)+(1*1*16))-1 downto (1*1*16));
        neighbor(1) <= reduced(1*0)(((2*VCI_LANES*32)+(1*0*16))-1 downto (1*0*16));
        neighbor(0) <= reduced(1*1)(((2*VCI_LANES*32)+(1*0*16))-1 downto (1*0*16));
        center      <= reduced(1*1)(((2*VCI_LANES*32)+(1*1*16))-1 downto (1*1*16));
      elsif mode = "010" then -- cycle 9
        neighbor(7) <= reduced(2*2)(((2*VCI_LANES*32)+(2*0*16))-1 downto (2*0*16));
        neighbor(6) <= reduced(2*2)(((2*VCI_LANES*32)+(2*1*16))-1 downto (2*1*16));
        neighbor(5) <= reduced(2*2)(((2*VCI_LANES*32)+(2*2*16))-1 downto (2*2*16));
        neighbor(4) <= reduced(2*1)(((2*VCI_LANES*32)+(2*2*16))-1 downto (2*2*16));
        neighbor(3) <= reduced(2*0)(((2*VCI_LANES*32)+(2*2*16))-1 downto (2*2*16));
        neighbor(2) <= reduced(2*0)(((2*VCI_LANES*32)+(2*1*16))-1 downto (2*1*16));
        neighbor(1) <= reduced(2*0)(((2*VCI_LANES*32)+(2*0*16))-1 downto (2*0*16));
        neighbor(0) <= reduced(2*1)(((2*VCI_LANES*32)+(2*0*16))-1 downto (2*0*16));
        center      <= reduced(2*1)(((2*VCI_LANES*32)+(2*1*16))-1 downto (2*1*16));
      elsif mode = "100" then -- cycle 16
        neighbor(7) <= reduced(4*2)(((2*VCI_LANES*32)+(4*0*16))-1 downto (4*0*16));
        neighbor(6) <= reduced(4*2)(((2*VCI_LANES*32)+(4*1*16))-1 downto (4*1*16));
        neighbor(5) <= reduced(4*2)(((2*VCI_LANES*32)+(4*2*16))-1 downto (4*2*16));
        neighbor(4) <= reduced(4*1)(((2*VCI_LANES*32)+(4*2*16))-1 downto (4*2*16));
        neighbor(3) <= reduced(4*0)(((2*VCI_LANES*32)+(4*2*16))-1 downto (4*2*16));
        neighbor(2) <= reduced(4*0)(((2*VCI_LANES*32)+(4*1*16))-1 downto (4*1*16));
        neighbor(1) <= reduced(4*0)(((2*VCI_LANES*32)+(4*0*16))-1 downto (4*0*16));
        neighbor(0) <= reduced(4*1)(((2*VCI_LANES*32)+(4*0*16))-1 downto (4*0*16));
        center      <= reduced(4*1)(((2*VCI_LANES*32)+(4*1*16))-1 downto (4*1*16));
      end if;
    end if;
  end process;

  -- generate 8-bit pattern (single wavefront)
  lbp_gen : for i in (VCI_LANES*4)-1 downto 0 generate
    repeat_bit_gen : for m in 7 downto 0 generate
      process (vci_clk)
      begin
        if vci_clk'event and vci_clk = '1' then  -- rising clock edge
          if unsigned(neighbor_half(m, i)) < unsigned(center_half(i)) then
            data_out_byte(i)(m) <= '0';
          else
            data_out_byte(i)(m) <= '1';
          end if;
        end if;
      end process; --cycle 6, 10, 17
    end generate repeat_bit_gen;
  end generate lbp_gen;

  --byte enables, flag and address
  process (vci_clk)
  begin
    if vci_clk'event and vci_clk = '1' then 
      if clk_en = '1' then
        -- byteena_out_gated_shifter(0) <= vci_byte_valid;
        flag_out_gated_shifter(0) <= vci_flag_a;
        dest_addr_gated_shifter(0)  <= vci_dest_addr_in;
      end if;

      if clk_en = '1' then
        if vci_vector_start = '1' then
          byteena_out_gated_shifter(byteena_out_gated_shifter'left downto 1) <= (others => (others => '0'));
          dest_addr_gated_shifter(dest_addr_gated_shifter'left downto 1) <= (others => (others => '0'));
          flag_out_gated_shifter(flag_out_gated_shifter'left downto 1) <= (others => (others => '0'));
        else
          byteena_out_gated_shifter(byteena_out_gated_shifter'left downto 1) <=
            byteena_out_gated_shifter(byteena_out_gated_shifter'left-1 downto 0);

          flag_out_gated_shifter(flag_out_gated_shifter'left downto 1) <=
            flag_out_gated_shifter(flag_out_gated_shifter'left-1 downto 0);

          dest_addr_gated_shifter(dest_addr_gated_shifter'left downto 1) <=
            dest_addr_gated_shifter(dest_addr_gated_shifter'left-1 downto 0);
        end if;
      end if;
    end if;
  end process;

  -- non gated
  process (vci_clk)
  begin
    if vci_clk'event and vci_clk = '1' then 
      -- byteena_out_shifter(0) <= byteena_out_gated_shifter(warm_up_stages);
      flag_out_shifter(0) <= flag_out_gated_shifter(warm_up_stages);
      dest_addr_shifter(0)  <= dest_addr_gated_shifter(warm_up_stages);

      byteena_out_shifter(byteena_out_shifter'left downto 1) <=
        byteena_out_shifter(byteena_out_shifter'left-1 downto 0);

      flag_out_shifter(flag_out_shifter'left downto 1) <=
        flag_out_shifter(flag_out_shifter'left-1 downto 0);

      dest_addr_shifter(dest_addr_shifter'left downto 1) <=
        dest_addr_shifter(dest_addr_shifter'left-1 downto 0);

      if warmed_up = '0' then
        byteena_out_shifter(0) <= (others => '0');
      else
        byteena_out_shifter(0) <= vci_byte_valid;
      end if;

    end if;
  end process;



  -- output signals, from the end of the pipeline shift registers
  vci_data_out      <= data_out;
  vci_flag_out      <= flag_out_shifter(flag_out_shifter'left);
  vci_dest_addr_out <= dest_addr_shifter(dest_addr_shifter'left);
  vci_byteenable    <= byteena_out_shifter(byteena_out_shifter'left);

end rtl;
