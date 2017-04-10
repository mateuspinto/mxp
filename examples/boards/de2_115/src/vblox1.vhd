library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fpga is
  port(

-- CLOCK --
    CLOCK_50  : in std_logic;
    CLOCK2_50 : in std_logic;
    CLOCK3_50 : in std_logic;

-- KEY --
    KEY : in std_logic_vector(3 downto 0);

-- SW --
    SW : in std_logic_vector(17 downto 0);

-- LED --
    LEDG : out std_logic_vector(7 downto 0);
    LEDR : out std_logic_vector(17 downto 0);

-- SEG7 --
    HEX0 : out std_logic_vector(6 downto 0);
    HEX1 : out std_logic_vector(6 downto 0);
    HEX2 : out std_logic_vector(6 downto 0);
    HEX3 : out std_logic_vector(6 downto 0);
    HEX4 : out std_logic_vector(6 downto 0);
    HEX5 : out std_logic_vector(6 downto 0);
    HEX6 : out std_logic_vector(6 downto 0);
    HEX7 : out std_logic_vector(6 downto 0);

-- VGA --
    VGA_B       : out    std_logic_vector(7 downto 0);
    VGA_BLANK_N : out    std_logic;
    VGA_CLK     : buffer std_logic;
    VGA_G       : out    std_logic_vector(7 downto 0);
    VGA_HS      : out    std_logic;
    VGA_R       : out    std_logic_vector(7 downto 0);
    VGA_SYNC_N  : out    std_logic;
    VGA_VS      : out    std_logic;

-- Audio --
    AUD_ADCDAT  : in    std_logic;
    AUD_ADCLRCK : inout std_logic;
    AUD_BCLK    : inout std_logic;
    AUD_DACDAT  : out   std_logic;
    AUD_DACLRCK : inout std_logic;
    AUD_XCK     : out   std_logic;

-- I2C for Audio and Tv-Decode  --
    I2C_SCLK : out   std_logic;
    I2C_SDAT : inout std_logic;

-- TV Decoder --
    TD_CLK27   : in  std_logic;
    TD_DATA    : in  std_logic_vector(7 downto 0);
    TD_HS      : in  std_logic;
    TD_RESET_N : out std_logic;
    TD_VS      : in  std_logic;

-- SDRAM --
    DRAM_ADDR  : out   std_logic_vector(12 downto 0);
    DRAM_BA    : out   std_logic_vector(1 downto 0);
    DRAM_CAS_N : out   std_logic;
    DRAM_CKE   : out   std_logic;
    DRAM_CLK   : out   std_logic;
    DRAM_CS_N  : out   std_logic;
    DRAM_DQ    : inout std_logic_vector(31 downto 0);
    DRAM_DQM   : out   std_logic_vector(3 downto 0);
    DRAM_RAS_N : out   std_logic;
    DRAM_WE_N  : out   std_logic;

-- SRAM --
    SRAM_ADDR : out   std_logic_vector(19 downto 0);
    SRAM_CE_N : out   std_logic;
    SRAM_DQ   : inout std_logic_vector(15 downto 0);
    SRAM_LB_N : out   std_logic;
    SRAM_OE_N : out   std_logic;
    SRAM_UB_N : out   std_logic;
    SRAM_WE_N : out   std_logic;

-- Flash --
    FL_ADDR  : out   std_logic_vector(22 downto 0);
    FL_CE_N  : out   std_logic;
    FL_DQ    : inout std_logic_vector(7 downto 0);
    FL_OE_N  : out   std_logic;
    FL_RST_N : out   std_logic;
    FL_RY    : in    std_logic;
    FL_WE_N  : out   std_logic;
    FL_WP_N  : out   std_logic

    );

end entity;

architecture rtl of fpga is
  component vblox1 is
    port (
      clk_50        : in  std_logic;
      clk_sdram_clk : out std_logic;
      reset_n       : in  std_logic;

      altpll_0_locked_conduit_export    : out std_logic;
      altpll_0_areset_conduit_export    : in  std_logic;
      altpll_0_phasedone_conduit_export : out std_logic;

      zs_addr_from_the_sdram      : out   std_logic_vector(12 downto 0);
      zs_ba_from_the_sdram        : out   std_logic_vector(1 downto 0);
      zs_cas_n_from_the_sdram     : out   std_logic;
      zs_cke_from_the_sdram       : out   std_logic;
      zs_cs_n_from_the_sdram      : out   std_logic;
      zs_dq_to_and_from_the_sdram : inout std_logic_vector(31 downto 0) := (others => 'X');
      zs_dqm_from_the_sdram       : out   std_logic_vector(3 downto 0);
      zs_ras_n_from_the_sdram     : out   std_logic;
      zs_we_n_from_the_sdram      : out   std_logic
      );
  end component vblox1;
begin

  LEDG <= (others => '0');
  LEDR <= (others => '0');

  HEX0 <= (others => '1');
  HEX1 <= (others => '1');
  HEX2 <= (others => '1');
  HEX3 <= (others => '1');
  HEX4 <= (others => '1');
  HEX5 <= (others => '1');
  HEX6 <= (others => '1');
  HEX7 <= (others => '1');

  VGA_CLK     <= '0';
  VGA_SYNC_N  <= '1';
  VGA_HS      <= '0';
  VGA_VS      <= '0';
  VGA_BLANK_N <= '1';
  VGA_R       <= (others => '0');
  VGA_G       <= (others => '0');
  VGA_B       <= (others => '0');

  AUD_DACDAT  <= '0';
  AUD_XCK     <= '0';

  I2C_SCLK    <= '0';

  TD_RESET_N  <= '0';

  SRAM_ADDR   <= (others => '0');
  SRAM_CE_N   <= '1';
  SRAM_LB_N   <= '1';
  SRAM_OE_N   <= '1';
  SRAM_UB_N   <= '1';
  SRAM_WE_N   <= '1';

  FL_ADDR     <= (others => '0');
  FL_CE_N     <= '1';
  FL_OE_N     <= '1';
  FL_RST_N    <= '1';
  FL_WE_N     <= '1';
  FL_WP_N     <= '1';

  qsys_system : component vblox1
    port map (
      clk_50           => CLOCK_50,
      clk_sdram_clk    => DRAM_CLK,
      reset_n          => '1',

      altpll_0_locked_conduit_export    => open,
      altpll_0_areset_conduit_export    => '0',
      altpll_0_phasedone_conduit_export => open,

      -- SDRAM
      zs_addr_from_the_sdram      => DRAM_ADDR,
      zs_ba_from_the_sdram        => DRAM_BA,
      zs_cas_n_from_the_sdram     => DRAM_CAS_N,
      zs_cke_from_the_sdram       => DRAM_CKE,
      zs_cs_n_from_the_sdram      => DRAM_CS_N,
      zs_dq_to_and_from_the_sdram => DRAM_DQ,
      zs_dqm_from_the_sdram       => DRAM_DQM,
      zs_ras_n_from_the_sdram     => DRAM_RAS_N,
      zs_we_n_from_the_sdram      => DRAM_WE_N
      );


end rtl;
