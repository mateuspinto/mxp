-- vci_lbp_lut.vhd
-- Copyright (C) 2015-2018 VectorBlox Computing, Inc.

-- synthesis library vci_lbp_lut_lib
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;

entity vci_lbp_lut is
  generic (
    VCI_LANES : positive := 2;
    BYTES_RAM : positive := 2
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

    vci_data_out   : out std_logic_vector(VCI_LANES*32-1 downto 0);
    vci_flag_out   : out std_logic_vector(VCI_LANES*4-1 downto 0);
    vci_byteenable : out std_logic_vector(VCI_LANES*4-1 downto 0)
    );
end;

architecture rtl of vci_lbp_lut is
  constant VCI_STAGES : positive := 3;
  constant LOGN_RAM   : positive := 8;

  constant SELECT_BIT : integer := 0;
  constant PASS_BIT   : integer := 23;
  constant FAIL_BIT   : integer := 22;
  constant LUT_BIT    : integer := 21;
  constant LUT_ADDR   : integer := 16;

  constant MODE_WRITE : std_logic_vector(2 downto 0) := "001";
  constant MODE_ZERO  : std_logic_vector(2 downto 0) := "010";
  constant MODE_INC   : std_logic_vector(2 downto 0) := "100";

  type   byteena_out_shifter_type is array (natural range <>) of std_logic_vector((VCI_LANES*4)-1 downto 0);
  signal flag_out_shifter    : byteena_out_shifter_type(VCI_STAGES-1 downto 0);
  signal byteena_out_shifter : byteena_out_shifter_type(VCI_STAGES-1 downto 0);

  --Outputs from the logic function
  signal data_out : std_logic_vector(VCI_LANES*32-1 downto 0);
  signal flag_out : std_logic_vector(VCI_LANES*4-1 downto 0);

  --Unpacked lbp and output
  signal pattern_a : std_logic_vector(VCI_LANES*32-1 downto 0) := (others => '0');
  signal pattern_b : std_logic_vector(VCI_LANES*32-1 downto 0) := (others => '0');
  signal pre_a     : std_logic_vector(VCI_LANES*32-1 downto 0) := (others => '0');
  signal pre_b     : std_logic_vector(VCI_LANES*32-1 downto 0) := (others => '0');

  type pass_array is array (natural range <>) of std_logic_vector(8*BYTES_RAM-1 downto 0);

  signal pattern_a_unpacked : pass_array(VCI_LANES*(4/BYTES_RAM)-1 downto 0);
  signal pattern_b_unpacked : pass_array(VCI_LANES*(4/BYTES_RAM)-1 downto 0);
  signal data_out_unpacked  : pass_array(VCI_LANES*(4/BYTES_RAM)-1 downto 0);

  type byte_array is array (natural range <>) of std_logic_vector(7 downto 0);
  signal lut_a              : byte_array(31 downto 0) := (others => (others => '0'));
  signal lut_b              : byte_array(31 downto 0) := (others => (others => '0'));

  signal pass_a             : std_logic_vector(8*BYTES_RAM-1 downto 0) := (others => '0');
  signal pass_b             : std_logic_vector(8*BYTES_RAM-1 downto 0) := (others => '0');

  signal fail_a             : std_logic_vector(8*BYTES_RAM-1 downto 0) := (others => '0');
  signal fail_b             : std_logic_vector(8*BYTES_RAM-1 downto 0) := (others => '0');

  signal ram_data_in        : std_logic_vector(8*BYTES_RAM-1 downto 0);
  signal ram_address        : std_logic_vector(LOGN_RAM-1 downto 0);

  signal count              : std_logic_vector(LOGN_RAM-1 downto 0);
  signal pass_a_we          : std_logic;
  signal fail_a_we          : std_logic;
  signal lut_a_we           : std_logic_vector(31 downto 0);
  signal pass_b_we          : std_logic;
  signal fail_b_we          : std_logic;
  signal lut_b_we           : std_logic_vector(31 downto 0);

  signal lut_sel            : unsigned(31 downto 0);


  component sync_ram
      generic(BYTES : positive;
              LOGN : positive);
      port (clk: in std_logic;
            we   : in std_logic;
            address : in std_logic_vector(LOGN-1 downto 0);
            data_in : in std_logic_vector(BYTES*8-1 downto 0);
            data_out : out std_logic_vector(BYTES*8-1 downto 0));
  end component;

  component decoder
      generic(LOGN : positive);
      port (a : in unsigned(LOGN-1 downto 0);
            b : out unsigned(2**LOGN-1 downto 0));
  end component;

begin
  
  p_a: sync_ram
      generic map (BYTES => BYTES_RAM, LOGN => LOGN_RAM)
      port map (clk => vci_clk,
                we => pass_a_we,
                address => ram_address,
                data_in => ram_data_in,
                data_out => pass_a);

  p_b: sync_ram
      generic map (BYTES => BYTES_RAM, LOGN => LOGN_RAM)
      port map (clk => vci_clk,
                we => pass_b_we,
                address => ram_address,
                data_in => ram_data_in,
                data_out => pass_b);

  f_a: sync_ram
      generic map (BYTES => BYTES_RAM, LOGN => LOGN_RAM)
      port map (clk => vci_clk,
                we => fail_a_we,
                address => ram_address,
                data_in => ram_data_in,
                data_out => fail_a);
  f_b: sync_ram
      generic map (BYTES => BYTES_RAM, LOGN => LOGN_RAM)
      port map (clk => vci_clk,
                we => fail_b_we,
                address => ram_address,
                data_in => ram_data_in,
                data_out => fail_b);

   gen_ram_a: for gbyte in 31 downto 0 generate
        lx: sync_ram
          generic map (BYTES => 1, LOGN => LOGN_RAM)
          port map (clk => vci_clk,
                    we => lut_a_we(gbyte),
                    address => ram_address,
                    data_in => ram_data_in(7 downto 0),
                    data_out => lut_a(gbyte));
   end generate gen_ram_a;

   gen_ram_b: for gbyte in 31 downto 0 generate
        lx: sync_ram
          generic map (BYTES => 1, LOGN => LOGN_RAM)
          port map (clk => vci_clk,
                    we => lut_b_we(gbyte),
                    address => ram_address,
                    data_in => ram_data_in(7 downto 0),
                    data_out => lut_b(gbyte));
   end generate gen_ram_b;

  -- 31-28 27-24 23-20 19-16 15-12 11-8 7-4  3-0
  -- 0000  000s  pflx  xxxx  0000  000d dddd ddds
  -- p = pass we
  -- f = fail we
  -- l = lut we (combined with below)
  -- x = which byte chunk of 256 lut
  -- d = LOGN data bits
  -- s = select eithe a or b

  d0: decoder
      generic map (LOGN => 5)
      port map (a => unsigned(vci_data_a(LUT_ADDR+4 downto LUT_ADDR)),
                b => lut_sel);
   
  --Change data interally to arrays of words for ease of use
  pack_unpack_gen : for g in VCI_LANES*(4/BYTES_RAM)-1 downto 0 generate
    pattern_a_unpacked(g) <= pattern_a(((g+1)*(8*BYTES_RAM))-1 downto g*(8*BYTES_RAM));
    pattern_b_unpacked(g) <= pattern_b(((g+1)*(8*BYTES_RAM))-1 downto g*(8*BYTES_RAM));
    data_out(((g+1)*(8*BYTES_RAM))-1 downto g*(8*BYTES_RAM)) <= std_logic_vector(data_out_unpacked(g));
  end generate pack_unpack_gen;

  process (vci_clk)
  begin  -- process
    if vci_clk'event and vci_clk = '1' then  -- rising clock edge
      if vci_valid = MODE_ZERO then
        count <= std_logic_vector(to_unsigned(1, count'length));
      elsif vci_vector_end = '1' and vci_valid = MODE_INC then
        count <= std_logic_vector(unsigned(count) + to_unsigned(1, count'length));
      end if;
    end if;
  end process;

  process (vci_clk)
  begin  -- process
    if vci_clk'event and vci_clk = '1' then  -- rising clock edge
      -- cycle 0
      if vci_valid = MODE_WRITE then
        ram_address <= vci_data_a(8 downto 1);
      elsif vci_valid = MODE_ZERO then
        ram_address <= (others => '0');
      else
        ram_address <= count;
      end if;

      ram_data_in <= vci_data_b(8*BYTES_RAM-1 downto 0);

      if vci_valid = MODE_WRITE then
        pass_a_we <= (not vci_data_a(SELECT_BIT)) and vci_data_a(PASS_BIT);
        fail_a_we <= (not vci_data_a(SELECT_BIT)) and vci_data_a(FAIL_BIT);
        pass_b_we <= vci_data_a(SELECT_BIT) and vci_data_a(PASS_BIT);
        fail_b_we <= vci_data_a(SELECT_BIT) and vci_data_a(FAIL_BIT);
      else
        pass_a_we <= '0';
        pass_b_we <= '0';
        fail_a_we <= '0';
        fail_b_we <= '0';
      end if;

      -- cycle 0
      pre_a <= vci_data_a;
      pre_b <= vci_data_b;
      -- cycle 1
      pattern_a <= pre_a;
      pattern_b <= pre_b;

    end if;
  end process;

  lut_ena_gen: for gbyte in 31 downto 0 generate
    process (vci_clk)
    begin  -- process
      if vci_clk'event and vci_clk = '1' then  -- rising clock edge
        -- cycle 0
        if vci_valid = MODE_WRITE then
          lut_a_we(gbyte) <= not vci_data_a(SELECT_BIT) and vci_data_a(LUT_BIT) and lut_sel(gbyte);
          lut_b_we(gbyte) <= vci_data_a(SELECT_BIT) and vci_data_a(LUT_BIT) and lut_sel(gbyte);
        else
          lut_a_we(gbyte) <= '0';
          lut_b_we(gbyte) <= '0';
        end if;
      end if;
    end process;
  end generate lut_ena_gen;

  output_gen : for g in VCI_LANES*(4/BYTES_RAM)-1 downto 0 generate
    process (vci_clk)
      variable grp_a : integer;
      variable idx_a : integer;
      variable grp_b : integer;
      variable idx_b : integer;
      variable pass_a_pass_b : std_logic_vector (8*BYTES_RAM-1 downto 0);
      variable pass_a_fail_b : std_logic_vector (8*BYTES_RAM-1 downto 0);
      variable fail_a_pass_b : std_logic_vector (8*BYTES_RAM-1 downto 0);
      variable fail_a_fail_b : std_logic_vector (8*BYTES_RAM-1 downto 0);
    begin
      if vci_clk'event and vci_clk = '1' then  -- rising clock edge
        -- cycle 2
        grp_a := to_integer(unsigned(pattern_a_unpacked(g)(7 downto 3)));
        idx_a := to_integer(unsigned(pattern_a_unpacked(g)(2 downto 0)));

        grp_b := to_integer(unsigned(pattern_b_unpacked(g)(7 downto 3)));
        idx_b := to_integer(unsigned(pattern_b_unpacked(g)(2 downto 0)));

        pass_a_pass_b := std_logic_vector(signed(pass_a) + signed(pass_b));
        pass_a_fail_b := std_logic_vector(signed(pass_a) + signed(fail_b));
        fail_a_pass_b := std_logic_vector(signed(fail_a) + signed(pass_b));
        fail_a_fail_b := std_logic_vector(signed(fail_a) + signed(fail_b));

        if lut_a(grp_a)(idx_a) = '0' then
          if lut_b(grp_b)(idx_b) = '0' then
            data_out_unpacked(g) <= pass_a_pass_b;
          else
            data_out_unpacked(g) <= pass_a_fail_b;
          end if;
        else
          if lut_b(grp_b)(idx_b) = '0' then
            data_out_unpacked(g) <= fail_a_pass_b;
          else
            data_out_unpacked(g) <= fail_a_fail_b;
          end if;
        end if;
      end if;
    end process;
  end generate output_gen;

  process (vci_clk)
  begin  -- process
    if vci_clk'event and vci_clk = '1' then  -- rising clock edge

      flag_out_shifter(0) <= flag_out;

      flag_out_shifter(flag_out_shifter'left downto 1) <=
        flag_out_shifter(flag_out_shifter'left-1 downto 0);

      if vci_valid = MODE_WRITE then
        byteena_out_shifter(0) <= (others => '0');
      else
        byteena_out_shifter(0) <= vci_byte_valid;
      end if;

      byteena_out_shifter(byteena_out_shifter'left downto 1) <=
        byteena_out_shifter(byteena_out_shifter'left-1 downto 0);

    end if;
  end process;

  --Output signals, from the end of the pipeline shift registers
  vci_data_out      <= data_out;
  vci_flag_out      <= flag_out_shifter(flag_out_shifter'left);
  vci_byteenable    <= byteena_out_shifter(byteena_out_shifter'left);

end rtl;
