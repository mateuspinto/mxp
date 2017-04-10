-- convolve_filter.vhd
-- Copyright (C) 2015 VectorBlox Computing, Inc.

-------------------------------------------------------------------------------
-- This entity takes in data for (potentially) multiple filter kernel copies.
-- The data to each copy overlaps horizontally, and for some kernels it may be
-- possible to share some of the computation.  For instance, in a seperable
-- convolution all copies could share the same computation of each column, and
-- then each individual copy would have to do the horizontal convolution
-- independently.
--
-- It currently assumes the copies all perform independent calculations and so
-- just creates multiple copies of the filter_kernel entity.
-------------------------------------------------------------------------------


-- synthesis library vci_convolve_lib
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity convolve_filter is
  generic (
    INPUT_SIZE_BYTES      : positive range 1 to 4  := 1;
    FILTER_WIDTH          : positive               := 3;
    FILTER_HEIGHT         : positive               := 3;
    FILTER_COPIES         : positive               := 1;
    COEFFICIENT_SIZE_BITS : positive range 1 to 32 := 16;
    CONVOLVE_OUTPUT_BITS  : positive               := 28;

    CONJOINED_MULTIPLIES : natural range 0 to 1  := 1;
    FXP_BITS             : natural range 0 to 32 := 7;

    CONVOLVE_STAGES       : natural := 4;
    INPUT_REGISTER_STAGES : natural := 1;
    ADD_TREE_STAGES       : natural := 2
    );
  port (
    clk   : in std_logic;
    reset : in std_logic;

    coefficients_in_flat : in std_logic_vector((FILTER_WIDTH*COEFFICIENT_SIZE_BITS*FILTER_HEIGHT)-1 downto 0);

    data_in_flat  : in  std_logic_vector(((FILTER_WIDTH+(FILTER_COPIES-1))*INPUT_SIZE_BYTES*8*FILTER_HEIGHT)-1 downto 0);
    data_out_flat : out std_logic_vector((FILTER_COPIES*CONVOLVE_OUTPUT_BITS)-1 downto 0)
    );
end;

architecture rtl of convolve_filter is
  function log2(
    constant N : positive)
    return natural is
    variable i : natural := 0;
  begin
    while (2**i < n) loop
      i := i + 1;
    end loop;
    return i;
  end log2;

  component multiplier_pipelined is
    generic (
      INPUT_A_WIDTH : positive := 8;
      INPUT_B_WIDTH : positive := 8;

      INPUT_REGISTER_STAGES  : natural := 0;
      OUTPUT_REGISTER_STAGES : natural := 0
      );
    port (
      clk   : in std_logic;
      reset : in std_logic;

      data_in_a : in signed(INPUT_A_WIDTH-1 downto 0);
      data_in_b : in signed(INPUT_B_WIDTH-1 downto 0);

      data_out : out signed((INPUT_A_WIDTH+INPUT_B_WIDTH)-1 downto 0)
      );
  end component multiplier_pipelined;

  component conjoined_multiplier_pipelined is
    generic (
      INPUT_AB_WIDTH : positive := 8;
      INPUT_C_WIDTH  : positive := 8;

      INPUT_REGISTER_STAGES  : natural := 0;
      OUTPUT_REGISTER_STAGES : natural := 0
      );
    port (
      clk   : in std_logic;
      reset : in std_logic;

      data_in_a : in signed(INPUT_AB_WIDTH-1 downto 0);
      data_in_b : in signed(INPUT_AB_WIDTH-1 downto 0);
      data_in_c : in signed(INPUT_C_WIDTH-1 downto 0);

      data_out_a : out signed((INPUT_AB_WIDTH+INPUT_C_WIDTH)-1 downto 0);
      data_out_b : out signed((INPUT_AB_WIDTH+INPUT_C_WIDTH)-1 downto 0)
      );
  end component conjoined_multiplier_pipelined;

  --The example filter kernel component
  component add_tree
    generic (
      INPUT_WIDTH     : positive := 32;
      OUTPUT_WIDTH    : positive := 32;
      LEAVES          : positive := 8;
      PIPELINE_STAGES : natural  := 0
      );
    port(
      clk    : in std_logic;
      clk_en : in std_logic;

      data_in  : in  std_logic_vector((INPUT_WIDTH*LEAVES)-1 downto 0);
      data_out : out std_logic_vector(OUTPUT_WIDTH-1 downto 0)
      );
  end component;

  constant FILTER_COPIES_DIV2   : natural  := FILTER_COPIES/2;
  constant FILTER_COPIES_PADDED : positive := 2*(FILTER_COPIES-FILTER_COPIES_DIV2);

  constant INPUT_SIZE_BITS         : positive := INPUT_SIZE_BYTES * 8;
  constant INPUT_ROW_SIZE_ELEMENTS : positive := FILTER_WIDTH+(FILTER_COPIES-1);
  constant INPUT_ROW_SIZE_BYTES    : positive := INPUT_ROW_SIZE_ELEMENTS*INPUT_SIZE_BYTES;
  constant INPUT_ROW_SIZE_BITS     : positive := INPUT_ROW_SIZE_BYTES * 8;

  constant MULTIPLIER_OUT_SIZE_BITS : positive := INPUT_SIZE_BITS+COEFFICIENT_SIZE_BITS;

  --Arrays for the input data once unflattened
  type data_in_array is array (natural range <>) of std_logic_vector(INPUT_ROW_SIZE_BITS-1 downto 0);
  signal data_in : data_in_array(FILTER_HEIGHT-1 downto 0);

  type coefficient_element_array is array (natural range <>) of signed(COEFFICIENT_SIZE_BITS-1 downto 0);
  type coefficient_row_array is array (natural range <>) of coefficient_element_array(FILTER_WIDTH-1 downto 0);
  signal coefficients_in : coefficient_row_array(FILTER_HEIGHT-1 downto 0);

  type filter_data_in_element_array is array (natural range <>) of signed(INPUT_SIZE_BITS-1 downto 0);
  type filter_data_in_row_array is array (natural range <>) of filter_data_in_element_array(FILTER_WIDTH-1 downto 0);
  type filter_data_in_array is array (natural range <>) of filter_data_in_row_array(FILTER_HEIGHT-1 downto 0);
  signal filter_data_in : filter_data_in_array(FILTER_COPIES-1 downto 0);

  type multiplier_data_out_element_array is array (natural range <>) of signed(MULTIPLIER_OUT_SIZE_BITS-1 downto 0);
  type multiplier_data_out_row_array is array (natural range <>) of multiplier_data_out_element_array(FILTER_WIDTH-1 downto 0);
  type multiplier_data_out_array is array (natural range <>) of multiplier_data_out_row_array(FILTER_HEIGHT-1 downto 0);
  signal multiplier_data_out : multiplier_data_out_array(FILTER_COPIES-1 downto 0);

  type add_tree_data_in_flat_array is array (natural range <>) of std_logic_vector((FILTER_HEIGHT*FILTER_WIDTH*MULTIPLIER_OUT_SIZE_BITS)-1 downto 0);
  signal add_tree_data_in_flat : add_tree_data_in_flat_array(FILTER_COPIES-1 downto 0);

  type data_out_array is array (natural range <>) of std_logic_vector(CONVOLVE_OUTPUT_BITS-1 downto 0);
  signal convolve_data_out : data_out_array(FILTER_COPIES-1 downto 0);
begin
  unflatten_gen : for grow in FILTER_HEIGHT-1 downto 0 generate
    data_in(grow) <= data_in_flat(((grow+1)*INPUT_ROW_SIZE_BITS)-1 downto grow*INPUT_ROW_SIZE_BITS);
    more_unflatten_gen : for gelement in FILTER_WIDTH-1 downto 0 generate
      coefficients_in(grow)(gelement)
        <= signed(coefficients_in_flat((((grow*FILTER_HEIGHT)+(gelement+1))*COEFFICIENT_SIZE_BITS)-1 downto ((grow*FILTER_HEIGHT)+gelement)*COEFFICIENT_SIZE_BITS));
    end generate more_unflatten_gen;
  end generate unflatten_gen;

  filter_copy_gen : for gcopy_div2 in (FILTER_COPIES_PADDED/2)-1 downto 0 generate
    filter_row_gen : for grow in FILTER_HEIGHT-1 downto 0 generate
      filter_element_gen : for gelement in FILTER_WIDTH-1 downto 0 generate
        filter_data_in((gcopy_div2*2)+0)(grow)(gelement)
          <= signed(data_in(grow)(((((gcopy_div2*2)+0)+(gelement+1))*INPUT_SIZE_BITS)-1 downto (((gcopy_div2*2)+0)+gelement)*INPUT_SIZE_BITS));
        unconjoined_multiplier0_gen : if (CONJOINED_MULTIPLIES = 0) or (((gcopy_div2*2)+0) = (FILTER_COPIES-1)) generate
          the_multiply : multiplier_pipelined
            generic map (
              INPUT_A_WIDTH => INPUT_SIZE_BITS,
              INPUT_B_WIDTH => COEFFICIENT_SIZE_BITS,

              INPUT_REGISTER_STAGES  => INPUT_REGISTER_STAGES,
              OUTPUT_REGISTER_STAGES => CONVOLVE_STAGES-(INPUT_REGISTER_STAGES+ADD_TREE_STAGES)
              )
            port map (
              clk   => clk,
              reset => reset,

              data_in_a => filter_data_in((gcopy_div2*2)+0)(grow)(gelement),
              data_in_b => coefficients_in(grow)(gelement),

              data_out => multiplier_data_out((gcopy_div2*2)+0)(grow)(gelement)
              );
        end generate unconjoined_multiplier0_gen;

        add_tree_data_in_flat((gcopy_div2*2)+0)((((grow*FILTER_HEIGHT)+gelement+1)*MULTIPLIER_OUT_SIZE_BITS)-1 downto
                                                ((grow*FILTER_HEIGHT)+gelement)*MULTIPLIER_OUT_SIZE_BITS) <=
          std_logic_vector(multiplier_data_out((gcopy_div2*2)+0)(grow)(gelement));

      end generate filter_element_gen;
    end generate filter_row_gen;

    --Final reduction sum
    reduction_sum : add_tree
      generic map (
        INPUT_WIDTH     => MULTIPLIER_OUT_SIZE_BITS,
        LEAVES          => FILTER_WIDTH*FILTER_HEIGHT,
        OUTPUT_WIDTH    => CONVOLVE_OUTPUT_BITS,
        PIPELINE_STAGES => ADD_TREE_STAGES
        )
      port map (
        clk    => clk,
        clk_en => '1',

        data_in  => add_tree_data_in_flat((gcopy_div2*2)+0),
        data_out => convolve_data_out((gcopy_div2*2)+0)
        );

    data_out_flat(((((gcopy_div2*2)+0)+1)*CONVOLVE_OUTPUT_BITS)-1 downto ((gcopy_div2*2)+0)*CONVOLVE_OUTPUT_BITS) <=
      convolve_data_out((gcopy_div2*2)+0);

    gcopy_div2_plus1_gen : if ((gcopy_div2*2)+1) < FILTER_COPIES generate
      filter_row_gen : for grow in FILTER_HEIGHT-1 downto 0 generate
        filter_element_gen : for gelement in FILTER_WIDTH-1 downto 0 generate
          filter_data_in((gcopy_div2*2)+1)(grow)(gelement)
            <= signed(data_in(grow)(((((gcopy_div2*2)+1)+(gelement+1))*INPUT_SIZE_BITS)-1 downto (((gcopy_div2*2)+1)+gelement)*INPUT_SIZE_BITS));
          unconjoined_multiplier1_gen : if CONJOINED_MULTIPLIES = 0 generate
            the_multiply : multiplier_pipelined
              generic map (
                INPUT_A_WIDTH => INPUT_SIZE_BITS,
                INPUT_B_WIDTH => COEFFICIENT_SIZE_BITS,

                INPUT_REGISTER_STAGES  => INPUT_REGISTER_STAGES,
                OUTPUT_REGISTER_STAGES => CONVOLVE_STAGES-(INPUT_REGISTER_STAGES+ADD_TREE_STAGES)
                )
              port map (
                clk   => clk,
                reset => reset,

                data_in_a => filter_data_in((gcopy_div2*2)+1)(grow)(gelement),
                data_in_b => coefficients_in(grow)(gelement),

                data_out => multiplier_data_out((gcopy_div2*2)+1)(grow)(gelement)
                );
          end generate unconjoined_multiplier1_gen;
          conjoined_multiplier_gen : if CONJOINED_MULTIPLIES /= 0 generate
            the_multiply : conjoined_multiplier_pipelined
              generic map (
                INPUT_AB_WIDTH => INPUT_SIZE_BITS,
                INPUT_C_WIDTH  => COEFFICIENT_SIZE_BITS,

                INPUT_REGISTER_STAGES  => INPUT_REGISTER_STAGES,
                OUTPUT_REGISTER_STAGES => CONVOLVE_STAGES-(INPUT_REGISTER_STAGES+ADD_TREE_STAGES)
                )
              port map (
                clk   => clk,
                reset => reset,

                data_in_a => filter_data_in((gcopy_div2*2)+0)(grow)(gelement),
                data_in_b => filter_data_in((gcopy_div2*2)+1)(grow)(gelement),
                data_in_c => coefficients_in(grow)(gelement),

                data_out_a => multiplier_data_out((gcopy_div2*2)+0)(grow)(gelement),
                data_out_b => multiplier_data_out((gcopy_div2*2)+1)(grow)(gelement)
                );
          end generate conjoined_multiplier_gen;

          add_tree_data_in_flat((gcopy_div2*2)+1)((((grow*FILTER_HEIGHT)+gelement+1)*MULTIPLIER_OUT_SIZE_BITS)-1 downto
                                                  ((grow*FILTER_HEIGHT)+gelement)*MULTIPLIER_OUT_SIZE_BITS) <=
            std_logic_vector(multiplier_data_out((gcopy_div2*2)+1)(grow)(gelement));

        end generate filter_element_gen;
      end generate filter_row_gen;

      --Final reduction sum
      reduction_sum : add_tree
        generic map (
          INPUT_WIDTH     => MULTIPLIER_OUT_SIZE_BITS,
          LEAVES          => FILTER_WIDTH*FILTER_HEIGHT,
          OUTPUT_WIDTH    => CONVOLVE_OUTPUT_BITS,
          PIPELINE_STAGES => ADD_TREE_STAGES
          )
        port map (
          clk    => clk,
          clk_en => '1',

          data_in  => add_tree_data_in_flat((gcopy_div2*2)+1),
          data_out => convolve_data_out((gcopy_div2*2)+1)
          );

      data_out_flat(((((gcopy_div2*2)+1)+1)*CONVOLVE_OUTPUT_BITS)-1 downto ((gcopy_div2*2)+1)*CONVOLVE_OUTPUT_BITS) <=
        convolve_data_out((gcopy_div2*2)+1);
    end generate gcopy_div2_plus1_gen;
  end generate filter_copy_gen;

-----------------------------------------------------------------------------
-- Assertions to make sure constants are valid
-----------------------------------------------------------------------------
  assert CONVOLVE_STAGES >= (INPUT_REGISTER_STAGES+ADD_TREE_STAGES)
    report "CONVOLVE_STAGES ("
    & positive'image(CONVOLVE_STAGES) &
    ") must be greater than or equal to INPUT_REGISTER_STAGES ("
    & positive'image(INPUT_REGISTER_STAGES) &
    ") plus ADD_TREE_STAGES ("
    & positive'image(ADD_TREE_STAGES) &
    ")."
    severity failure;

end rtl;


-----------------------------------------------------------------------------
-- Conjoined multiplier to synthesize better on Xilinx non-fracturable multipliers
-----------------------------------------------------------------------------
-- synthesis library vci_convolve_lib
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity conjoined_multiplier_pipelined is
  generic (
    INPUT_AB_WIDTH : positive := 8;
    INPUT_C_WIDTH  : positive := 8;

    INPUT_REGISTER_STAGES  : natural := 0;
    OUTPUT_REGISTER_STAGES : natural := 0
    );
  port (
    clk   : in std_logic;
    reset : in std_logic;

    data_in_a : in signed(INPUT_AB_WIDTH-1 downto 0);
    data_in_b : in signed(INPUT_AB_WIDTH-1 downto 0);
    data_in_c : in signed(INPUT_C_WIDTH-1 downto 0);

    data_out_a : out signed((INPUT_AB_WIDTH+INPUT_C_WIDTH)-1 downto 0);
    data_out_b : out signed((INPUT_AB_WIDTH+INPUT_C_WIDTH)-1 downto 0)
    );
end;

architecture rtl of conjoined_multiplier_pipelined is
  type correction_array is array (natural range <>) of signed((INPUT_AB_WIDTH+INPUT_C_WIDTH)-1 downto 0);
  signal correction_a_c_negative_d    : correction_array(INPUT_REGISTER_STAGES downto 0);
  signal correction_a_a_negative_d    : correction_array(INPUT_REGISTER_STAGES downto 0);
  signal correction_a_both_negative_d : correction_array(INPUT_REGISTER_STAGES downto 0);
  signal correction_b_c_negative_d    : correction_array(INPUT_REGISTER_STAGES downto 0);
  signal correction_b_b_negative_d    : correction_array(INPUT_REGISTER_STAGES downto 0);
  signal correction_b_both_negative_d : correction_array(INPUT_REGISTER_STAGES downto 0);
  type input_ab_array is array (natural range <>) of unsigned((2*(INPUT_AB_WIDTH-1))+(INPUT_C_WIDTH-1)-1 downto 0);
  signal data_in_ab_d                 : input_ab_array(INPUT_REGISTER_STAGES downto 0);
  type input_c_array is array (natural range <>) of unsigned((INPUT_C_WIDTH-1)-1 downto 0);
  signal data_in_c_d                  : input_c_array(INPUT_REGISTER_STAGES downto 0);

  attribute dont_touch                 : string;
  attribute dont_touch of data_in_ab_d : signal is "true";
  attribute dont_touch of data_in_c_d  : signal is "true";

  type output_array is array (natural range <>) of unsigned((2*(INPUT_AB_WIDTH-1))+(2*(INPUT_C_WIDTH-1))-1 downto 0);
  signal correction_a_d : correction_array(OUTPUT_REGISTER_STAGES downto 0);
  signal correction_b_d : correction_array(OUTPUT_REGISTER_STAGES downto 0);
  signal data_out_ab_d  : output_array(OUTPUT_REGISTER_STAGES downto 0);

  signal uncorrected_out_a : signed((INPUT_AB_WIDTH+INPUT_C_WIDTH)-1 downto 0);
  signal uncorrected_out_b : signed((INPUT_AB_WIDTH+INPUT_C_WIDTH)-1 downto 0);
begin
  correction_a_c_negative_d(0)((INPUT_AB_WIDTH+INPUT_C_WIDTH)-1 downto (INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)) <= (others => '0');
  correction_a_c_negative_d(0)((INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)-1 downto INPUT_C_WIDTH-1) <=
    data_in_a((INPUT_AB_WIDTH-1)-1 downto 0) when data_in_c(INPUT_C_WIDTH-1) = '1' else
    (others => '0');
  correction_a_c_negative_d(0)((INPUT_C_WIDTH-1)-1 downto 0) <= (others => '0');

  correction_a_a_negative_d(0)((INPUT_AB_WIDTH+INPUT_C_WIDTH)-1 downto (INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)) <= (others => '0');
  correction_a_a_negative_d(0)((INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)-1 downto INPUT_AB_WIDTH-1) <=
    data_in_C((INPUT_C_WIDTH-1)-1 downto 0) when data_in_a(INPUT_AB_WIDTH-1) = '1' else
    (others => '0');
  correction_a_a_negative_d(0)((INPUT_AB_WIDTH-1)-1 downto 0) <= (others => '0');

  correction_a_both_negative_d(0)((INPUT_AB_WIDTH+INPUT_C_WIDTH)-1 downto (INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)+1) <= (others => '0');
  correction_a_both_negative_d(0)((INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1))                                           <= data_in_a(INPUT_AB_WIDTH-1) and data_in_c(INPUT_C_WIDTH-1);
  correction_a_both_negative_d(0)((INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)-1 downto 0)                                <= (others => '0');

  correction_b_c_negative_d(0)((INPUT_AB_WIDTH+INPUT_C_WIDTH)-1 downto (INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)) <= (others => '0');
  correction_b_c_negative_d(0)((INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)-1 downto INPUT_C_WIDTH-1) <=
    data_in_b((INPUT_AB_WIDTH-1)-1 downto 0) when data_in_c(INPUT_C_WIDTH-1) = '1' else
    (others => '0');
  correction_b_c_negative_d(0)((INPUT_C_WIDTH-1)-1 downto 0) <= (others => '0');

  correction_b_b_negative_d(0)((INPUT_AB_WIDTH+INPUT_C_WIDTH)-1 downto (INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)) <= (others => '0');
  correction_b_b_negative_d(0)((INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)-1 downto INPUT_AB_WIDTH-1) <=
    data_in_C((INPUT_C_WIDTH-1)-1 downto 0) when data_in_b(INPUT_AB_WIDTH-1) = '1' else
    (others => '0');
  correction_b_b_negative_d(0)((INPUT_AB_WIDTH-1)-1 downto 0) <= (others => '0');

  correction_b_both_negative_d(0)((INPUT_AB_WIDTH+INPUT_C_WIDTH)-1 downto (INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)+1) <= (others => '0');
  correction_b_both_negative_d(0)((INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1))                                           <= data_in_b(INPUT_AB_WIDTH-1) and data_in_c(INPUT_C_WIDTH-1);
  correction_b_both_negative_d(0)((INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)-1 downto 0)                                <= (others => '0');


  data_in_ab_d(0)((INPUT_AB_WIDTH-1)-1 downto 0) <=
    unsigned(data_in_a((INPUT_AB_WIDTH-1)-1 downto 0));
  data_in_ab_d(0)((INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)-1 downto INPUT_AB_WIDTH-1) <=
    (others => '0');
  data_in_ab_d(0)((2*(INPUT_AB_WIDTH-1))+(INPUT_C_WIDTH-1)-1 downto (INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)) <=
    unsigned(data_in_b((INPUT_AB_WIDTH-1)-1 downto 0));

  data_in_c_d(0) <= unsigned(data_in_c((INPUT_C_WIDTH-1)-1 downto 0));

  input_pipeline_gen : if INPUT_REGISTER_STAGES > 0 generate
    input_pipeline_proc : process (clk) is
    begin  -- process input_pipeline_proc
      if clk'event and clk = '1' then   -- rising clock edge
        correction_a_c_negative_d(INPUT_REGISTER_STAGES downto 1) <=
          correction_a_c_negative_d(INPUT_REGISTER_STAGES-1 downto 0);
        correction_a_a_negative_d(INPUT_REGISTER_STAGES downto 1) <=
          correction_a_a_negative_d(INPUT_REGISTER_STAGES-1 downto 0);
        correction_a_both_negative_d(INPUT_REGISTER_STAGES downto 1) <=
          correction_a_both_negative_d(INPUT_REGISTER_STAGES-1 downto 0);
        correction_b_c_negative_d(INPUT_REGISTER_STAGES downto 1) <=
          correction_b_c_negative_d(INPUT_REGISTER_STAGES-1 downto 0);
        correction_b_b_negative_d(INPUT_REGISTER_STAGES downto 1) <=
          correction_b_b_negative_d(INPUT_REGISTER_STAGES-1 downto 0);
        correction_b_both_negative_d(INPUT_REGISTER_STAGES downto 1) <=
          correction_b_both_negative_d(INPUT_REGISTER_STAGES-1 downto 0);

        data_in_ab_d(INPUT_REGISTER_STAGES downto 1) <= data_in_ab_d(INPUT_REGISTER_STAGES-1 downto 0);
        data_in_c_d(INPUT_REGISTER_STAGES downto 1)  <= data_in_c_d(INPUT_REGISTER_STAGES-1 downto 0);
      end if;
    end process input_pipeline_proc;
  end generate input_pipeline_gen;

  correction_a_d(0) <= correction_a_both_negative_d(INPUT_REGISTER_STAGES) - (correction_a_c_negative_d(INPUT_REGISTER_STAGES) + correction_a_a_negative_d(INPUT_REGISTER_STAGES));
  correction_b_d(0) <= correction_b_both_negative_d(INPUT_REGISTER_STAGES) - (correction_b_c_negative_d(INPUT_REGISTER_STAGES) + correction_b_b_negative_d(INPUT_REGISTER_STAGES));

  data_out_ab_d(0) <= data_in_ab_d(INPUT_REGISTER_STAGES) * data_in_c_d(INPUT_REGISTER_STAGES);

  output_pipeline_gen : if OUTPUT_REGISTER_STAGES > 0 generate
    output_pipeline_proc : process (clk) is
    begin  -- process output_pipeline_proc
      if clk'event and clk = '1' then   -- rising clock edge
        correction_a_d(OUTPUT_REGISTER_STAGES downto 1) <= correction_a_d(OUTPUT_REGISTER_STAGES-1 downto 0);
        correction_b_d(OUTPUT_REGISTER_STAGES downto 1) <= correction_b_d(OUTPUT_REGISTER_STAGES-1 downto 0);
        data_out_ab_d(OUTPUT_REGISTER_STAGES downto 1)  <= data_out_ab_d(OUTPUT_REGISTER_STAGES-1 downto 0);
      end if;
    end process output_pipeline_proc;
  end generate output_pipeline_gen;

  uncorrected_out_a(uncorrected_out_a'left downto (INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)) <= (others => '0');
  uncorrected_out_a((INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)-1 downto 0) <=
    signed(data_out_ab_d(OUTPUT_REGISTER_STAGES)((INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)-1 downto 0));
  uncorrected_out_b(uncorrected_out_b'left downto (INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)) <= (others => '0');
  uncorrected_out_b((INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)-1 downto 0) <=
    signed(data_out_ab_d(OUTPUT_REGISTER_STAGES)((2*(INPUT_AB_WIDTH-1))+(2*(INPUT_C_WIDTH-1))-1 downto
                                                 (INPUT_AB_WIDTH-1)+(INPUT_C_WIDTH-1)));

  data_out_a <= uncorrected_out_a + correction_a_d(OUTPUT_REGISTER_STAGES);
  data_out_b <= uncorrected_out_b + correction_b_d(OUTPUT_REGISTER_STAGES);
end rtl;


-----------------------------------------------------------------------------
-- Multipliers moved to a separate entity for better synthesis
-----------------------------------------------------------------------------
-- synthesis library vci_convolve_lib
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplier_pipelined is
  generic (
    INPUT_A_WIDTH : positive := 8;
    INPUT_B_WIDTH : positive := 8;

    INPUT_REGISTER_STAGES  : natural := 0;
    OUTPUT_REGISTER_STAGES : natural := 0
    );
  port (
    clk   : in std_logic;
    reset : in std_logic;

    data_in_a : in signed(INPUT_A_WIDTH-1 downto 0);
    data_in_b : in signed(INPUT_B_WIDTH-1 downto 0);

    data_out : out signed((INPUT_A_WIDTH+INPUT_B_WIDTH)-1 downto 0)
    );
end;

architecture rtl of multiplier_pipelined is
  type input_a_array is array (natural range <>) of signed(INPUT_A_WIDTH-1 downto 0);
  signal data_in_a_d : input_a_array(INPUT_REGISTER_STAGES downto 0);
  type input_b_array is array (natural range <>) of signed(INPUT_B_WIDTH-1 downto 0);
  signal data_in_b_d : input_b_array(INPUT_REGISTER_STAGES downto 0);

  attribute dont_touch                : string;
  attribute dont_touch of data_in_a_d : signal is "true";
  attribute dont_touch of data_in_b_d : signal is "true";

  type output_array is array (natural range <>) of signed((INPUT_A_WIDTH+INPUT_B_WIDTH)-1 downto 0);
  signal data_out_d : output_array(OUTPUT_REGISTER_STAGES downto 0);
begin
  data_in_a_d(0) <= data_in_a;
  data_in_b_d(0) <= data_in_b;

  input_pipeline_gen : if INPUT_REGISTER_STAGES > 0 generate
    input_pipeline_proc : process (clk) is
    begin  -- process input_pipeline_proc
      if clk'event and clk = '1' then   -- rising clock edge
        data_in_a_d(INPUT_REGISTER_STAGES downto 1) <= data_in_a_d(INPUT_REGISTER_STAGES-1 downto 0);
        data_in_b_d(INPUT_REGISTER_STAGES downto 1) <= data_in_b_d(INPUT_REGISTER_STAGES-1 downto 0);
      end if;
    end process input_pipeline_proc;
  end generate input_pipeline_gen;

  data_out_d(0) <= data_in_a_d(INPUT_REGISTER_STAGES) * data_in_b_d(INPUT_REGISTER_STAGES);

  output_pipeline_gen : if OUTPUT_REGISTER_STAGES > 0 generate
    output_pipeline_proc : process (clk) is
    begin  -- process output_pipeline_proc
      if clk'event and clk = '1' then   -- rising clock edge
        data_out_d(OUTPUT_REGISTER_STAGES downto 1) <= data_out_d(OUTPUT_REGISTER_STAGES-1 downto 0);
      end if;
    end process output_pipeline_proc;
  end generate output_pipeline_gen;

  data_out <= data_out_d(OUTPUT_REGISTER_STAGES);
end rtl;
