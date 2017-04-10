-- add_tree.vhd
-- Copyright (C) 2015 VectorBlox Computing, Inc.

-------------------------------------------------------------------------------
-- This is an add reduction tree with a configurable number of pipeline stages.
-------------------------------------------------------------------------------

-- synthesis library vci_convolve_lib
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity add_tree is
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
end entity add_tree;

architecture rtl of add_tree is
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

  function is_registered_stage (
    constant REGISTERS  : integer;
    constant STAGES     : natural;
    constant THIS_STAGE : natural)
    return boolean is
    variable reg_stage : natural;
  begin
    for ireg in REGISTERS-1 downto 0 loop
      reg_stage := ((ireg+1)*STAGES)/(REGISTERS+1);
      if reg_stage = THIS_STAGE then
        return true;
      end if;
    end loop;  -- ireg

    return false;
  end is_registered_stage;

  constant LEVELS        : natural  := log2(LEAVES);
  constant PADDED_LEAVES : positive := 2**LEVELS;
  type     output_array is array (natural range <>) of signed(OUTPUT_WIDTH-1 downto 0);
  signal   add_tree      : output_array(2*PADDED_LEAVES-1 downto 1);
  signal   add_tree_out  : signed(OUTPUT_WIDTH-1 downto 0);
begin
  full_leaves_gen : for gleaf in LEAVES-1 downto 0 generate
    initial_reg_gen : if PIPELINE_STAGES > 0 generate
      initial_reg : process (clk)
      begin  -- process initial_reg
        if clk'event and clk = '1' then
          if clk_en = '1' then
            add_tree(gleaf+PADDED_LEAVES) <=
              resize(signed(data_in((gleaf+1)*INPUT_WIDTH-1 downto gleaf*INPUT_WIDTH)), OUTPUT_WIDTH);
          end if;
        end if;
      end process initial_reg;
    end generate initial_reg_gen;
    no_initial_reg_gen : if PIPELINE_STAGES = 0 generate
      add_tree(gleaf+PADDED_LEAVES) <=
        resize(signed(data_in((gleaf+1)*INPUT_WIDTH-1 downto gleaf*INPUT_WIDTH)), OUTPUT_WIDTH);
    end generate no_initial_reg_gen;
  end generate full_leaves_gen;
  empty_leaves_gen : for gleaf in PADDED_LEAVES-1 downto LEAVES generate
    add_tree(gleaf+PADDED_LEAVES) <= (others => '0');
  end generate empty_leaves_gen;

  tree_level_gen : for glevel in LEVELS-1 downto 0 generate
    branch_gen : for gbranch in (2**glevel)-1 downto 0 generate
      noreg_stage : if is_registered_stage(PIPELINE_STAGES-2, LEVELS, LEVELS-(glevel+1)) = false generate
        add_tree((2**glevel)+gbranch) <=
          add_tree((2**(glevel+1))+(2*gbranch+1)) + add_tree((2**(glevel+1))+(2*gbranch));
      end generate noreg_stage;

      reg_stage : if is_registered_stage(PIPELINE_STAGES-2, LEVELS, LEVELS-(glevel+1)) = true generate
        reg_proc : process (clk)
        begin  -- process reg_proc
          if clk'event and clk = '1' then
            if clk_en = '1' then
              add_tree((2**glevel)+gbranch) <= add_tree((2**(glevel+1))+(2*gbranch+1)) + add_tree((2**(glevel+1))+(2*gbranch));
            end if;
          end if;
        end process reg_proc;
      end generate reg_stage;
    end generate branch_gen;
  end generate tree_level_gen;

  end_reg_gen : if PIPELINE_STAGES > 1 generate
    end_reg : process (clk)
    begin  -- process end_reg
      if clk'event and clk = '1' then
        if clk_en = '1' then
          add_tree_out <= add_tree(1);
        end if;
      end if;
    end process end_reg;
  end generate end_reg_gen;
  no_end_reg_gen :  if PIPELINE_STAGES <= 1 generate
    add_tree_out <= add_tree(1);
  end generate no_end_reg_gen;

  no_extra_levels_gen : if LEVELS+2 >= PIPELINE_STAGES generate
    data_out <= std_logic_vector(add_tree_out);
  end generate no_extra_levels_gen;

  extra_stages_gen : if PIPELINE_STAGES > LEVELS+2 generate
    constant EXTRA_STAGES   : positive := PIPELINE_STAGES - (LEVELS+2);
    signal   add_tree_out_d : output_array(EXTRA_STAGES downto 0);
  begin
    add_tree_out_d(0) <= add_tree_out;

    out_shift : process (clk)
    begin  -- process out_shift
      if clk'event and clk = '1' then
        if clk_en = '1' then
          add_tree_out_d(EXTRA_STAGES downto 1) <= add_tree_out_d(EXTRA_STAGES-1 downto 0);
        end if;
      end if;
    end process out_shift;

    data_out <= std_logic_vector(add_tree_out_d(EXTRA_STAGES));
  end generate extra_stages_gen;
  
end architecture rtl;
