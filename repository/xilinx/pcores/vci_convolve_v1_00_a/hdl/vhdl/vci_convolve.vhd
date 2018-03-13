-- vci_convolve.vhd
-- Copyright (C) 2015 VectorBlox Computing, Inc.

-------------------------------------------------------------------------------
-- This custom instruction serves as a template for general convolve filters.
--
-- A filter of FILTER_WIDTH*FILTER_HEIGHT dimensions can be instantiated as a
-- submodule.  Additionally, FILTER_COPIES copies of the filter can be run
-- within a row to provide data level parallelism. For a 5x5 filter with 3
-- copies, for instance, a 7x5 window is needed every cycle to allow for the 3
-- 5x5 filter instances to run in parallel.
--
-- This module takes care of reading in data and structuring it; submodules
-- implement the actual filter(s).
-------------------------------------------------------------------------------


-- synthesis library vci_convolve_lib
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity vci_convolve is
  generic (
    VCI_LANES : positive := 4;

    CONJOINED_MULTIPLIES      : natural range 0 to 1  := 1;
    DOUBLE_CLOCKED_MULTIPLIES : natural range 0 to 1  := 0;
    FXP_BITS                  : natural range 0 to 32 := 7;

    INPUT_SIZE_BYTES      : positive range 1 to 4     := 1;
    OUTPUT_SIZE_BYTES     : positive range 1 to 4     := 2;
    COEFFICIENT_SIZE_BITS : positive range 1 to 32    := 16;
    MAX_COEFFICIENTS      : positive range 2 to 32768 := 1024;
    FILTER_WIDTH          : positive                  := 3;
    FILTER_HEIGHT         : positive                  := 3;
    FILTER_COPIES         : positive                  := 1;
    COEFFICIENT_COPIES    : positive range 1 to 256   := 1;
    FILTER_STAGES         : positive range 3 to 16    := 5;
    INPUT_REGISTER_STAGES : natural range 0 to 16     := 1;
    ADD_TREE_STAGES       : natural range 0 to 16     := 2
    );
  port (
    vci_clk    : in std_logic;
    vci_clk_2x : in std_logic;
    vci_reset  : in std_logic;

    vci_valid  : in std_logic_vector(2 downto 0);
    vci_signed : in std_logic;
    vci_opsize : in std_logic_vector(1 downto 0);

    vci_vector_start : in std_logic;
    vci_vector_end   : in std_logic;
    vci_byte_valid   : in std_logic_vector((VCI_LANES*4)-1 downto 0);

    vci_data_a : in std_logic_vector((VCI_LANES*32)-1 downto 0);
    vci_flag_a : in std_logic_vector((VCI_LANES*4)-1 downto 0);
    vci_data_b : in std_logic_vector((VCI_LANES*32)-1 downto 0);
    vci_flag_b : in std_logic_vector((VCI_LANES*4)-1 downto 0);

    vci_data_out   : out std_logic_vector((VCI_LANES*32)-1 downto 0);
    vci_flag_out   : out std_logic_vector((VCI_LANES*4)-1 downto 0);
    vci_byteenable : out std_logic_vector((VCI_LANES*4)-1 downto 0)
    );
end;

architecture rtl of vci_convolve is
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

  function one_half_signed_fxp (
    constant FXP_BITS : natural;
    constant WIDTH    : positive)
    return signed is
    variable one_half : signed(WIDTH-1 downto 0);
  begin  -- function one_half_signed_fxp
    one_half := (others => '0');
    if (FXP_BITS > 0) and (FXP_BITS < WIDTH) then
      one_half(FXP_BITS-1) := '1';
    end if;

    return one_half;
  end function one_half_signed_fxp;

  function saturate_threshold_signed (
    signal input_data     : signed;
    constant OUTPUT_WIDTH : positive)
    return signed is
    variable input_data_copy : signed(input_data'length-1 downto 0);
    variable output_data     : signed(OUTPUT_WIDTH-1 downto 0);
    variable overflow        : boolean;
  begin  -- function saturate_threshold_signed
    input_data_copy := input_data;
    output_data     := resize(input_data_copy, OUTPUT_WIDTH);

    overflow := false;
    for ibit in input_data_copy'left-1 downto OUTPUT_WIDTH-1 loop
      if input_data_copy(ibit) /= input_data_copy(input_data_copy'left) then
        overflow := true;
      end if;
    end loop;  -- ibit

    if overflow then
      output_data(OUTPUT_WIDTH-1)          := input_data_copy(input_data_copy'left);
      output_data(OUTPUT_WIDTH-2 downto 0) := (others => not input_data_copy(input_data_copy'left));
    end if;

    return output_data;
  end function saturate_threshold_signed;

  --The subcomponent that implements the actual filter
  component convolve_filter
    generic (
      INPUT_SIZE_BYTES      : positive range 1 to 4  := 1;
      FILTER_WIDTH          : positive               := 3;
      FILTER_HEIGHT         : positive               := 3;
      FILTER_COPIES         : positive               := 1;
      COEFFICIENT_SIZE_BITS : positive range 1 to 32 := 16;
      CONVOLVE_OUTPUT_BITS  : positive               := 28;

      CONJOINED_MULTIPLIES      : natural range 0 to 1  := 1;
      DOUBLE_CLOCKED_MULTIPLIES : natural range 0 to 1  := 1;
      FXP_BITS                  : natural range 0 to 32 := 7;

      CONVOLVE_STAGES       : natural := 4;
      INPUT_REGISTER_STAGES : natural := 1;
      ADD_TREE_STAGES       : natural := 2
      );
    port (
      clk    : in std_logic;
      clk_2x : in std_logic;
      reset  : in std_logic;

      coefficients_in_flat : in std_logic_vector((FILTER_WIDTH*COEFFICIENT_SIZE_BITS*FILTER_HEIGHT)-1 downto 0);

      data_in_flat : in std_logic_vector(((FILTER_WIDTH+(FILTER_COPIES-1))*INPUT_SIZE_BYTES*8*FILTER_HEIGHT)-1 downto 0);

      data_out_flat : out std_logic_vector((FILTER_COPIES*CONVOLVE_OUTPUT_BITS)-1 downto 0)
      );
  end component;

  --A single port RAM; separate entity for synthesis tools
  component sp_ram
    generic (
      WIDTH        : positive := 8;
      DEPTH        : positive := 32;
      ADDRESS_BITS : positive := 5
      );
    port (
      clk : in std_logic;

      address : in unsigned(ADDRESS_BITS-1 downto 0);

      write_enable : in std_logic;
      data_in      : in std_logic_vector(WIDTH-1 downto 0);

      data_out : out std_logic_vector(WIDTH-1 downto 0)
      );
  end component;

  constant INPUT_SIZE_BITS         : positive := INPUT_SIZE_BYTES * 8;
  constant INPUT_ROW_SIZE_ELEMENTS : positive := (FILTER_WIDTH-1)+FILTER_COPIES;
  constant INPUT_ROW_SIZE_BYTES    : positive := INPUT_ROW_SIZE_ELEMENTS*INPUT_SIZE_BYTES;
  constant INPUT_ROW_SIZE_BITS     : positive := INPUT_ROW_SIZE_BYTES * 8;

  constant OUTPUT_SIZE_BITS     : positive := OUTPUT_SIZE_BYTES*8;
  constant CONVOLVE_OUTPUT_BITS : positive := INPUT_SIZE_BITS+COEFFICIENT_SIZE_BITS+log2(FILTER_WIDTH*FILTER_HEIGHT);
  constant SUM_OUTPUT_BITS      : positive := INPUT_SIZE_BITS+COEFFICIENT_SIZE_BITS+log2((FILTER_WIDTH*FILTER_HEIGHT*4)+1);

  --Arrays for the input data.  Read in one line of data per valid cycle.
  type data_in_array is array (natural range <>) of std_logic_vector(INPUT_ROW_SIZE_BITS-1 downto 0);
  signal data_in_a : data_in_array(FILTER_HEIGHT-1 downto 0);
  signal data_in_b : data_in_array(FILTER_HEIGHT-1 downto 0);
  signal data_in_c : data_in_array(FILTER_HEIGHT-1 downto 0);
  signal data_in_d : data_in_array(FILTER_HEIGHT-1 downto 0);

  type data_out_array is array (natural range <>) of signed(CONVOLVE_OUTPUT_BITS-1 downto 0);
  signal data_out_a : data_out_array(FILTER_COPIES-1 downto 0);
  signal data_out_b : data_out_array(FILTER_COPIES-1 downto 0);
  signal data_out_c : data_out_array(FILTER_COPIES-1 downto 0);
  signal data_out_d : data_out_array(FILTER_COPIES-1 downto 0);

  type sum_rounded_array is array (natural range <>) of signed(SUM_OUTPUT_BITS-1 downto 0);
  signal data_out_sum_rounded : sum_rounded_array(FILTER_COPIES-1 downto 0);

  type saturated_thresholded_array is array (natural range <>) of signed(OUTPUT_SIZE_BITS-1 downto 0);
  signal data_out_saturated_thresholded : saturated_thresholded_array(FILTER_COPIES-1 downto 0);

  --Output shifters for data and byteenables
  type byteenable_array is array (natural range <>) of std_logic_vector((VCI_LANES*4)-1 downto 0);
  signal byteenable_d : byteenable_array(FILTER_STAGES downto 0);

  signal read_coefficient_index      : unsigned(log2(MAX_COEFFICIENTS)-1 downto 0);
  signal next_read_coefficient_index : unsigned(log2(MAX_COEFFICIENTS)-1 downto 0);
  signal write_coefficient_index     : unsigned(log2(MAX_COEFFICIENTS)-1 downto 0);
  signal coefficient_index           : unsigned(log2(MAX_COEFFICIENTS)-1 downto 0);
  signal row_write_index             : unsigned(log2(FILTER_HEIGHT)-1 downto 0);
  signal last_row_per_coefficient    : unsigned(15 downto 0);
  signal row                         : unsigned(15 downto 0);
  signal last_coefficient            : unsigned(log2(MAX_COEFFICIENTS)-1 downto 0);

  signal coefficient_copy_write_mask : std_logic_vector(COEFFICIENT_COPIES-1 downto 0);
begin

  --May use less than the full input row depending on configuration
  element_gen : for gelement in INPUT_ROW_SIZE_ELEMENTS-1 downto 0 generate
    data_in_a(0)(((gelement+1)*INPUT_SIZE_BITS)-1 downto gelement*INPUT_SIZE_BITS) <=
      vci_data_a((((2*gelement)+1)*INPUT_SIZE_BITS)-1 downto 2*gelement*INPUT_SIZE_BITS);
    data_in_b(0)(((gelement+1)*INPUT_SIZE_BITS)-1 downto gelement*INPUT_SIZE_BITS) <=
      vci_data_b((((2*gelement)+1)*INPUT_SIZE_BITS)-1 downto 2*gelement*INPUT_SIZE_BITS);
    data_in_c(0)(((gelement+1)*INPUT_SIZE_BITS)-1 downto gelement*INPUT_SIZE_BITS) <=
      vci_data_a((((2*gelement)+2)*INPUT_SIZE_BITS)-1 downto ((2*gelement)+1)*INPUT_SIZE_BITS);
    data_in_d(0)(((gelement+1)*INPUT_SIZE_BITS)-1 downto gelement*INPUT_SIZE_BITS) <=
      vci_data_b((((2*gelement)+2)*INPUT_SIZE_BITS)-1 downto ((2*gelement)+1)*INPUT_SIZE_BITS);
  end generate element_gen;

  process (read_coefficient_index, vci_valid, row, last_row_per_coefficient, last_coefficient, vci_reset) is
  begin  -- process
    next_read_coefficient_index <= read_coefficient_index;
    if vci_valid(0) = '1' then
      if row = last_row_per_coefficient then
        next_read_coefficient_index <= read_coefficient_index + to_unsigned(1, read_coefficient_index'length);
        if read_coefficient_index = last_coefficient then
          next_read_coefficient_index <= to_unsigned(0, next_read_coefficient_index'length);
        end if;
      end if;
    end if;

    if vci_valid(2) = '1' then
      next_read_coefficient_index <= to_unsigned(0, next_read_coefficient_index'length);
    end if;

    if vci_reset = '1' then
      next_read_coefficient_index <= to_unsigned(0, next_read_coefficient_index'length);
    end if;
  end process;

  --Shift in new data one pair of wavefronts at a time
  process (vci_clk)
  begin  -- process
    if vci_clk'event and vci_clk = '1' then
      read_coefficient_index <= next_read_coefficient_index;

      if vci_valid(0) = '1' then
        data_in_a(data_in_a'left downto 1) <= data_in_a(data_in_a'left-1 downto 0);
        data_in_b(data_in_b'left downto 1) <= data_in_b(data_in_b'left-1 downto 0);
        data_in_c(data_in_c'left downto 1) <= data_in_c(data_in_c'left-1 downto 0);
        data_in_d(data_in_d'left downto 1) <= data_in_d(data_in_d'left-1 downto 0);

        row <= row + to_unsigned(1, row'length);
        if row = last_row_per_coefficient then
          row <= to_unsigned(0, row'length);
        end if;
      end if;

      if vci_valid(1) = '1' then
        row_write_index <= row_write_index + to_unsigned(1, row_write_index'length);
        if row_write_index = FILTER_HEIGHT-1 then
          row_write_index         <= to_unsigned(0, row_write_index'length);
          write_coefficient_index <= write_coefficient_index + to_unsigned(1, write_coefficient_index'length);
          if write_coefficient_index = last_coefficient then
            write_coefficient_index <= to_unsigned(0, write_coefficient_index'length);
          end if;
        end if;
      end if;

      if vci_valid(2) = '1' then
        if vci_data_a(31) = '0' then
          write_coefficient_index  <= to_unsigned(0, write_coefficient_index'length);
          row_write_index          <= to_unsigned(0, row_write_index'length);
          last_row_per_coefficient <= unsigned(vci_data_a(15 downto 0));
          row                      <= to_unsigned(0, row'length);
          last_coefficient         <= unsigned(vci_data_a(15+log2(MAX_COEFFICIENTS) downto 16));
        else
          for icoefficient_copy in COEFFICIENT_COPIES-1 downto 0 loop
            if ((unsigned(vci_data_a(7 downto 0)) <= to_unsigned(icoefficient_copy, 8)) and
                (unsigned(vci_data_a(15 downto 8)) >= to_unsigned(icoefficient_copy, 8))) then
              coefficient_copy_write_mask(icoefficient_copy) <= '0';
            else
              coefficient_copy_write_mask(icoefficient_copy) <= '1';
            end if;
          end loop;  -- icoefficient_copy
        end if;
      end if;

      if vci_reset = '1' then
        write_coefficient_index     <= to_unsigned(0, write_coefficient_index'length);
        row_write_index             <= to_unsigned(0, row_write_index'length);
        last_row_per_coefficient    <= to_unsigned(0, last_row_per_coefficient'length);
        row                         <= to_unsigned(0, row'length);
        last_coefficient            <= to_unsigned(0, last_coefficient'length);
        coefficient_copy_write_mask <= (others => '0');
      end if;
    end if;
  end process;

  coefficient_index <= write_coefficient_index when vci_valid(1) = '1' else next_read_coefficient_index;

  --The subcomponent that implements the actual filter
  coefficient_copy_gen : for gcoefficient_copy in COEFFICIENT_COPIES-1 downto 0 generate
    constant FILTER_COPY_START                   : natural  := (FILTER_COPIES*gcoefficient_copy)/COEFFICIENT_COPIES;
    constant FILTER_COPY_END                     : natural  := (FILTER_COPIES*(gcoefficient_copy+1))/COEFFICIENT_COPIES;
    constant FILTER_COPIES_THIS_COEFFICIENT_COPY : positive := FILTER_COPY_END-FILTER_COPY_START;

    signal coefficient_ram_we : std_logic_vector(FILTER_HEIGHT-1 downto 0);

    type coefficient_array is array (natural range <>) of std_logic_vector((FILTER_WIDTH*COEFFICIENT_SIZE_BITS)-1 downto 0);
    signal coefficients_in_a : coefficient_array(FILTER_HEIGHT-1 downto 0);
    signal coefficients_in_b : coefficient_array(FILTER_HEIGHT-1 downto 0);
    signal coefficients_in_c : coefficient_array(FILTER_HEIGHT-1 downto 0);
    signal coefficients_in_d : coefficient_array(FILTER_HEIGHT-1 downto 0);

    signal coefficients_in_a_flat : std_logic_vector((FILTER_WIDTH*COEFFICIENT_SIZE_BITS*FILTER_HEIGHT)-1 downto 0);
    signal coefficients_in_b_flat : std_logic_vector((FILTER_WIDTH*COEFFICIENT_SIZE_BITS*FILTER_HEIGHT)-1 downto 0);
    signal coefficients_in_c_flat : std_logic_vector((FILTER_WIDTH*COEFFICIENT_SIZE_BITS*FILTER_HEIGHT)-1 downto 0);
    signal coefficients_in_d_flat : std_logic_vector((FILTER_WIDTH*COEFFICIENT_SIZE_BITS*FILTER_HEIGHT)-1 downto 0);

    signal data_in_a_flat : std_logic_vector((((FILTER_WIDTH-1)+FILTER_COPIES_THIS_COEFFICIENT_COPY)*INPUT_SIZE_BITS*FILTER_HEIGHT)-1 downto 0);
    signal data_in_b_flat : std_logic_vector((((FILTER_WIDTH-1)+FILTER_COPIES_THIS_COEFFICIENT_COPY)*INPUT_SIZE_BITS*FILTER_HEIGHT)-1 downto 0);
    signal data_in_c_flat : std_logic_vector((((FILTER_WIDTH-1)+FILTER_COPIES_THIS_COEFFICIENT_COPY)*INPUT_SIZE_BITS*FILTER_HEIGHT)-1 downto 0);
    signal data_in_d_flat : std_logic_vector((((FILTER_WIDTH-1)+FILTER_COPIES_THIS_COEFFICIENT_COPY)*INPUT_SIZE_BITS*FILTER_HEIGHT)-1 downto 0);

    --Outputs from the convolution
    signal data_out_a_flat : std_logic_vector((FILTER_COPIES_THIS_COEFFICIENT_COPY*CONVOLVE_OUTPUT_BITS)-1 downto 0);
    signal data_out_b_flat : std_logic_vector((FILTER_COPIES_THIS_COEFFICIENT_COPY*CONVOLVE_OUTPUT_BITS)-1 downto 0);
    signal data_out_c_flat : std_logic_vector((FILTER_COPIES_THIS_COEFFICIENT_COPY*CONVOLVE_OUTPUT_BITS)-1 downto 0);
    signal data_out_d_flat : std_logic_vector((FILTER_COPIES_THIS_COEFFICIENT_COPY*CONVOLVE_OUTPUT_BITS)-1 downto 0);

    constant INPUT_COPY_ROW_SIZE_ELEMENTS : positive := (FILTER_WIDTH-1)+FILTER_COPIES_THIS_COEFFICIENT_COPY;
    constant INPUT_COPY_ROW_SIZE_BYTES    : positive := INPUT_COPY_ROW_SIZE_ELEMENTS*INPUT_SIZE_BYTES;
    constant INPUT_COPY_ROW_SIZE_BITS     : positive := INPUT_COPY_ROW_SIZE_BYTES * 8;
  begin
    --Flatten data for passing to submodules
    flatten_gen : for grow in FILTER_HEIGHT-1 downto 0 generate
      coefficient_ram_we(grow) <=
        vci_valid(1) and (not coefficient_copy_write_mask(gcoefficient_copy)) when
        row_write_index = to_unsigned((FILTER_HEIGHT-1)-grow, row_write_index'length) else
        '0';
      the_coefficient_ram_a : sp_ram
        generic map (
          WIDTH        => FILTER_WIDTH*COEFFICIENT_SIZE_BITS,
          DEPTH        => MAX_COEFFICIENTS,
          ADDRESS_BITS => log2(MAX_COEFFICIENTS)
          )
        port map (
          clk => vci_clk,

          address => coefficient_index,

          write_enable => coefficient_ram_we(grow),
          data_in      => vci_data_a((FILTER_WIDTH*COEFFICIENT_SIZE_BITS)-1 downto 0),

          data_out => coefficients_in_a(grow)
          );

      the_coefficient_ram_b : sp_ram
        generic map (
          WIDTH        => FILTER_WIDTH*COEFFICIENT_SIZE_BITS,
          DEPTH        => MAX_COEFFICIENTS,
          ADDRESS_BITS => log2(MAX_COEFFICIENTS)
          )
        port map (
          clk => vci_clk,

          address => coefficient_index,

          write_enable => coefficient_ram_we(grow),
          data_in      => vci_data_b((FILTER_WIDTH*COEFFICIENT_SIZE_BITS)-1 downto 0),

          data_out => coefficients_in_b(grow)
          );

      the_coefficient_ram_c : sp_ram
        generic map (
          WIDTH        => FILTER_WIDTH*COEFFICIENT_SIZE_BITS,
          DEPTH        => MAX_COEFFICIENTS,
          ADDRESS_BITS => log2(MAX_COEFFICIENTS)
          )
        port map (
          clk => vci_clk,

          address => coefficient_index,

          write_enable => coefficient_ram_we(grow),
          data_in      => vci_data_a((FILTER_WIDTH*COEFFICIENT_SIZE_BITS*2)-1 downto FILTER_WIDTH*COEFFICIENT_SIZE_BITS),

          data_out => coefficients_in_c(grow)
          );

      the_coefficient_ram_d : sp_ram
        generic map (
          WIDTH        => FILTER_WIDTH*COEFFICIENT_SIZE_BITS,
          DEPTH        => MAX_COEFFICIENTS,
          ADDRESS_BITS => log2(MAX_COEFFICIENTS)
          )
        port map (
          clk => vci_clk,

          address => coefficient_index,

          write_enable => coefficient_ram_we(grow),
          data_in      => vci_data_b((FILTER_WIDTH*COEFFICIENT_SIZE_BITS*2)-1 downto FILTER_WIDTH*COEFFICIENT_SIZE_BITS),

          data_out => coefficients_in_d(grow)
          );

      data_in_a_flat(((grow+1)*INPUT_COPY_ROW_SIZE_BITS)-1 downto grow*INPUT_COPY_ROW_SIZE_BITS) <=
        data_in_a(grow)((((FILTER_WIDTH-1)+FILTER_COPY_END)*INPUT_SIZE_BITS)-1 downto FILTER_COPY_START*INPUT_SIZE_BITS);
      data_in_b_flat(((grow+1)*INPUT_COPY_ROW_SIZE_BITS)-1 downto grow*INPUT_COPY_ROW_SIZE_BITS) <=
        data_in_b(grow)((((FILTER_WIDTH-1)+FILTER_COPY_END)*INPUT_SIZE_BITS)-1 downto FILTER_COPY_START*INPUT_SIZE_BITS);
      data_in_c_flat(((grow+1)*INPUT_COPY_ROW_SIZE_BITS)-1 downto grow*INPUT_COPY_ROW_SIZE_BITS) <=
        data_in_c(grow)((((FILTER_WIDTH-1)+FILTER_COPY_END)*INPUT_SIZE_BITS)-1 downto FILTER_COPY_START*INPUT_SIZE_BITS);
      data_in_d_flat(((grow+1)*INPUT_COPY_ROW_SIZE_BITS)-1 downto grow*INPUT_COPY_ROW_SIZE_BITS) <=
        data_in_d(grow)((((FILTER_WIDTH-1)+FILTER_COPY_END)*INPUT_SIZE_BITS)-1 downto FILTER_COPY_START*INPUT_SIZE_BITS);

      coefficients_in_a_flat(((grow+1)*(FILTER_WIDTH*COEFFICIENT_SIZE_BITS))-1 downto
                             grow*(FILTER_WIDTH*COEFFICIENT_SIZE_BITS)) <=
        coefficients_in_a(grow);
      coefficients_in_b_flat(((grow+1)*(FILTER_WIDTH*COEFFICIENT_SIZE_BITS))-1 downto
                             grow*(FILTER_WIDTH*COEFFICIENT_SIZE_BITS)) <=
        coefficients_in_b(grow);
      coefficients_in_c_flat(((grow+1)*(FILTER_WIDTH*COEFFICIENT_SIZE_BITS))-1 downto
                             grow*(FILTER_WIDTH*COEFFICIENT_SIZE_BITS)) <=
        coefficients_in_c(grow);
      coefficients_in_d_flat(((grow+1)*(FILTER_WIDTH*COEFFICIENT_SIZE_BITS))-1 downto
                             grow*(FILTER_WIDTH*COEFFICIENT_SIZE_BITS)) <=
        coefficients_in_d(grow);
    end generate flatten_gen;

    convolve_filter_a : convolve_filter
      generic map (
        INPUT_SIZE_BYTES      => INPUT_SIZE_BYTES,
        FILTER_WIDTH          => FILTER_WIDTH,
        FILTER_HEIGHT         => FILTER_HEIGHT,
        FILTER_COPIES         => FILTER_COPIES_THIS_COEFFICIENT_COPY,
        COEFFICIENT_SIZE_BITS => COEFFICIENT_SIZE_BITS,
        CONVOLVE_OUTPUT_BITS  => CONVOLVE_OUTPUT_BITS,

        CONJOINED_MULTIPLIES      => CONJOINED_MULTIPLIES,
        DOUBLE_CLOCKED_MULTIPLIES => DOUBLE_CLOCKED_MULTIPLIES,
        FXP_BITS                  => FXP_BITS,

        CONVOLVE_STAGES       => FILTER_STAGES-1,
        INPUT_REGISTER_STAGES => INPUT_REGISTER_STAGES,
        ADD_TREE_STAGES       => ADD_TREE_STAGES
        )
      port map (
        clk    => vci_clk,
        clk_2x => vci_clk_2x,
        reset  => vci_reset,

        coefficients_in_flat => coefficients_in_a_flat,

        data_in_flat => data_in_a_flat,

        data_out_flat => data_out_a_flat
        );

    convolve_filter_b : convolve_filter
      generic map (
        INPUT_SIZE_BYTES      => INPUT_SIZE_BYTES,
        FILTER_WIDTH          => FILTER_WIDTH,
        FILTER_HEIGHT         => FILTER_HEIGHT,
        FILTER_COPIES         => FILTER_COPIES_THIS_COEFFICIENT_COPY,
        COEFFICIENT_SIZE_BITS => COEFFICIENT_SIZE_BITS,
        CONVOLVE_OUTPUT_BITS  => CONVOLVE_OUTPUT_BITS,

        CONJOINED_MULTIPLIES      => CONJOINED_MULTIPLIES,
        DOUBLE_CLOCKED_MULTIPLIES => DOUBLE_CLOCKED_MULTIPLIES,
        FXP_BITS                  => FXP_BITS,

        CONVOLVE_STAGES       => FILTER_STAGES-1,
        INPUT_REGISTER_STAGES => INPUT_REGISTER_STAGES,
        ADD_TREE_STAGES       => ADD_TREE_STAGES
        )
      port map (
        clk    => vci_clk,
        clk_2x => vci_clk_2x,
        reset  => vci_reset,

        coefficients_in_flat => coefficients_in_b_flat,

        data_in_flat => data_in_b_flat,

        data_out_flat => data_out_b_flat
        );

    convolve_filter_c : convolve_filter
      generic map (
        INPUT_SIZE_BYTES      => INPUT_SIZE_BYTES,
        FILTER_WIDTH          => FILTER_WIDTH,
        FILTER_HEIGHT         => FILTER_HEIGHT,
        FILTER_COPIES         => FILTER_COPIES_THIS_COEFFICIENT_COPY,
        COEFFICIENT_SIZE_BITS => COEFFICIENT_SIZE_BITS,
        CONVOLVE_OUTPUT_BITS  => CONVOLVE_OUTPUT_BITS,

        CONJOINED_MULTIPLIES      => CONJOINED_MULTIPLIES,
        DOUBLE_CLOCKED_MULTIPLIES => DOUBLE_CLOCKED_MULTIPLIES,
        FXP_BITS                  => FXP_BITS,

        CONVOLVE_STAGES       => FILTER_STAGES-1,
        INPUT_REGISTER_STAGES => INPUT_REGISTER_STAGES,
        ADD_TREE_STAGES       => ADD_TREE_STAGES
        )
      port map (
        clk    => vci_clk,
        clk_2x => vci_clk_2x,
        reset  => vci_reset,

        coefficients_in_flat => coefficients_in_c_flat,

        data_in_flat => data_in_c_flat,

        data_out_flat => data_out_c_flat
        );

    convolve_filter_d : convolve_filter
      generic map (
        INPUT_SIZE_BYTES      => INPUT_SIZE_BYTES,
        FILTER_WIDTH          => FILTER_WIDTH,
        FILTER_HEIGHT         => FILTER_HEIGHT,
        FILTER_COPIES         => FILTER_COPIES_THIS_COEFFICIENT_COPY,
        COEFFICIENT_SIZE_BITS => COEFFICIENT_SIZE_BITS,
        CONVOLVE_OUTPUT_BITS  => CONVOLVE_OUTPUT_BITS,

        CONJOINED_MULTIPLIES      => CONJOINED_MULTIPLIES,
        DOUBLE_CLOCKED_MULTIPLIES => DOUBLE_CLOCKED_MULTIPLIES,
        FXP_BITS                  => FXP_BITS,

        CONVOLVE_STAGES       => FILTER_STAGES-1,
        INPUT_REGISTER_STAGES => INPUT_REGISTER_STAGES,
        ADD_TREE_STAGES       => ADD_TREE_STAGES
        )
      port map (
        clk    => vci_clk,
        clk_2x => vci_clk_2x,
        reset  => vci_reset,

        coefficients_in_flat => coefficients_in_d_flat,

        data_in_flat => data_in_d_flat,

        data_out_flat => data_out_d_flat
        );

    filter_copy_gen : for gfilter_copy in FILTER_COPIES_THIS_COEFFICIENT_COPY-1 downto 0 generate
      data_out_a(FILTER_COPY_START+gfilter_copy) <= signed(data_out_a_flat(((gfilter_copy+1)*CONVOLVE_OUTPUT_BITS)-1 downto gfilter_copy*CONVOLVE_OUTPUT_BITS));
      data_out_b(FILTER_COPY_START+gfilter_copy) <= signed(data_out_b_flat(((gfilter_copy+1)*CONVOLVE_OUTPUT_BITS)-1 downto gfilter_copy*CONVOLVE_OUTPUT_BITS));
      data_out_c(FILTER_COPY_START+gfilter_copy) <= signed(data_out_c_flat(((gfilter_copy+1)*CONVOLVE_OUTPUT_BITS)-1 downto gfilter_copy*CONVOLVE_OUTPUT_BITS));
      data_out_d(FILTER_COPY_START+gfilter_copy) <= signed(data_out_d_flat(((gfilter_copy+1)*CONVOLVE_OUTPUT_BITS)-1 downto gfilter_copy*CONVOLVE_OUTPUT_BITS));
    end generate filter_copy_gen;
  end generate coefficient_copy_gen;

  filter_copy_gen : for gfilter_copy in FILTER_COPIES-1 downto 0 generate
    sum_round_proc : process (vci_clk) is
    begin  -- process sum_round_proc
      if vci_clk'event and vci_clk = '1' then  -- rising clock edge
        data_out_sum_rounded(gfilter_copy) <= resize(signed(data_out_a(gfilter_copy)), SUM_OUTPUT_BITS) +
                                              resize(signed(data_out_b(gfilter_copy)), SUM_OUTPUT_BITS) +
                                              resize(signed(data_out_c(gfilter_copy)), SUM_OUTPUT_BITS) +
                                              resize(signed(data_out_d(gfilter_copy)), SUM_OUTPUT_BITS) +
                                              one_half_signed_fxp(FXP_BITS, SUM_OUTPUT_BITS);
      end if;
    end process sum_round_proc;

    data_out_saturated_thresholded(gfilter_copy) <=
      saturate_threshold_signed(data_out_sum_rounded(gfilter_copy)(data_out_sum_rounded(gfilter_copy)'left downto FXP_BITS),
                                OUTPUT_SIZE_BITS);

    --Actual data to be written back
    vci_data_out(((gfilter_copy+1)*OUTPUT_SIZE_BITS)-1 downto
                 (gfilter_copy)*OUTPUT_SIZE_BITS) <=
      std_logic_vector(data_out_saturated_thresholded(gfilter_copy));
  end generate filter_copy_gen;

  --Padding of data
  vci_data_out((VCI_LANES*4*8)-1 downto (FILTER_COPIES)*OUTPUT_SIZE_BITS) <= (others => '0');

  vci_flag_out <= (others => '0');

  --Extend data if not writing back full wavefronts
  byteenable_d(0)(((FILTER_COPIES)*OUTPUT_SIZE_BYTES)-1 downto 0) <=
    vci_byte_valid(((FILTER_COPIES+FILTER_WIDTH-1)*OUTPUT_SIZE_BYTES)-1 downto (FILTER_WIDTH-1)*OUTPUT_SIZE_BYTES);
  byteenable_d(0)((VCI_LANES*4)-1 downto (FILTER_COPIES)*OUTPUT_SIZE_BYTES) <= (others => '0');

  --Delay byteenables by the same amount as the filter was delayed
  process (vci_clk)
  begin  -- process
    if vci_clk'event and vci_clk = '1' then
      byteenable_d(byteenable_d'left downto 1) <=
        byteenable_d(byteenable_d'left-1 downto 0);
    end if;
  end process;
  vci_byteenable <= byteenable_d(byteenable_d'left) when vci_valid(1) = '0' and vci_valid(2) = '0' else (others => '0');

-----------------------------------------------------------------------------
-- Assertions to make sure constants are valid
-----------------------------------------------------------------------------
  assert VCI_LANES*32 >= FILTER_WIDTH*COEFFICIENT_SIZE_BITS*2
    report "VCI_LANES*32 (" &
    positive'image(VCI_LANES*32) &
    ") must be greater than or equal to FILTER_WIDTH*COEFFICIENT_SIZE_BITS*2 (" &
    positive'image(FILTER_WIDTH*COEFFICIENT_SIZE_BITS*2) &
    ")."
    severity failure;

  assert INPUT_SIZE_BYTES = 1 or INPUT_SIZE_BYTES = 2 or INPUT_SIZE_BYTES = 4
    report "INPUT_SIZE_BYTES (" &
    positive'image(INPUT_SIZE_BYTES) &
    ") must be 1/2/4 (byte/halfword/word)."
    severity failure;

  assert OUTPUT_SIZE_BYTES = 1 or OUTPUT_SIZE_BYTES = 2 or OUTPUT_SIZE_BYTES = 4
    report "OUTPUT_SIZE_BYTES (" &
    positive'image(OUTPUT_SIZE_BYTES) &
    ") must be 1/2/4 (byte/halfword/word)."
    severity failure;

  assert MAX_COEFFICIENTS > 1
    report "MAX_COEFFICIENTS (" &
    positive'image(MAX_COEFFICIENTS) &
    ") must be greater than 1."
    severity failure;

  assert VCI_LANES*4 >= (FILTER_WIDTH+(FILTER_COPIES-1))*(INPUT_SIZE_BYTES*2)
    report "VCI_LANES (" &
    positive'image(VCI_LANES) &
    " is not wide enough for the requested filter configuration.  " &
    "VCI_LANES*4 must be greater than or equal to (FILTER_WIDTH+(FILTER_COPIES-1))*(INPUT_SIZE_BYTES*2) (" &
    natural'image((FILTER_WIDTH+(FILTER_COPIES-1))*(INPUT_SIZE_BYTES*2)) &
    ")."
    severity failure;

  assert VCI_LANES*4 >= (FILTER_WIDTH+(FILTER_COPIES-1))*OUTPUT_SIZE_BYTES
    report "VCI_LANES (" &
    positive'image(VCI_LANES) &
    " is not wide enough for the requested filter configuration.  " &
    "VCI_LANES*4 must be greater than or equal to (FILTER_WIDTH+(FILTER_COPIES-1))*OUTPUT_SIZE_BYTES (" &
    natural'image((FILTER_WIDTH+(FILTER_COPIES-1))*OUTPUT_SIZE_BYTES) &
    ")."
    severity failure;

  assert VCI_LANES*32 >= FILTER_WIDTH*COEFFICIENT_SIZE_BITS
    report "VCI_LANES (" &
    positive'image(VCI_LANES) &
    " is not wide enough for the requested filter configuration.  " &
    "VCI_LANES*32 must be greater than or equal to FILTER_WIDTH*COEFFICIENT_SIZE_BITS (" &
    natural'image(FILTER_WIDTH*COEFFICIENT_SIZE_BITS) &
    ")."
    severity failure;

  assert FILTER_COPIES >= COEFFICIENT_COPIES
    report "FILTER_COPIES (" &
    positive'image(FILTER_COPIES) &
    " must be greater than or equal to COEFFICIENT_COPIES (" &
    natural'image(COEFFICIENT_COPIES) &
    ")."
    severity failure;

end rtl;


-----------------------------------------------------------------------------
-- RAMs moved to a separate entity for better synthesis
-----------------------------------------------------------------------------
-- synthesis library vci_convolve_lib
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity sp_ram is
  generic (
    WIDTH        : positive := 8;
    DEPTH        : positive := 32;
    ADDRESS_BITS : positive := 5
    );
  port (
    clk : in std_logic;

    address : in unsigned(ADDRESS_BITS-1 downto 0);

    write_enable : in std_logic;
    data_in      : in std_logic_vector(WIDTH-1 downto 0);

    data_out : out std_logic_vector(WIDTH-1 downto 0)
    );
end;

architecture rtl of sp_ram is
  type ram_type is array (natural range <>) of std_logic_vector(WIDTH-1 downto 0);
  signal ram : ram_type(DEPTH-1 downto 0);
begin
  process (clk) is
  begin  -- process
    if clk'event and clk = '1' then     -- rising clock edge
      if write_enable = '1' then
        ram(to_integer(address)) <= data_in;
      end if;
      data_out <= ram(to_integer(address));
    end if;
  end process;
end rtl;
