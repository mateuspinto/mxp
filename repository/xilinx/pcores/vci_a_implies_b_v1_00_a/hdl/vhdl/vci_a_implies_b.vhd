-- vci_a_implies_b.vhd
-- Copyright (C) 2014-2018 VectorBlox Computing, Inc.

-------------------------------------------------------------------------------
-- This is an introductory custom instruction, meant to show the structure of
-- a simple two-input, one output custom instruction.  It computes A implies B,
-- i.e. (not A) or B.
-------------------------------------------------------------------------------


-- synthesis library vci_a_implies_b_lib
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity vci_a_implies_b is
  generic (
    VCI_LANES : positive := 2
    );
  port (
    vci_clk   : in std_logic;
    vci_reset : in std_logic;

    vci_valid  : in std_logic;
    vci_signed : in std_logic;
    vci_opsize : in std_logic_vector(1 downto 0);

    vci_vector_start : in std_logic;
    vci_vector_end   : in std_logic;
    vci_byte_valid   : in std_logic_vector(VCI_LANES*4-1 downto 0);

    vci_data_a : in std_logic_vector(VCI_LANES*32-1 downto 0);
    vci_flag_a : in std_logic_vector(VCI_LANES*4-1 downto 0);
    vci_data_b : in std_logic_vector(VCI_LANES*32-1 downto 0);
    vci_flag_b : in std_logic_vector(VCI_LANES*4-1 downto 0);

    vci_data_out      : out std_logic_vector(VCI_LANES*32-1 downto 0);
    vci_flag_out      : out std_logic_vector(VCI_LANES*4-1 downto 0);
    vci_byteenable    : out std_logic_vector(VCI_LANES*4-1 downto 0)
    );
end;

architecture rtl of vci_a_implies_b is
  signal data_a_implies_b : std_logic_vector(VCI_LANES*32-1 downto 0);
  signal flag_a_implies_b : std_logic_vector(VCI_LANES*4-1 downto 0);
begin

  --Logic to compute A implies B; true if B is true or A is false
  data_a_implies_b <= (not vci_data_a) or vci_data_b;

  --Also perform the operation on flag bits
  flag_a_implies_b <= (not vci_flag_a) or vci_flag_b;

  --Output signals
  vci_data_out      <= data_a_implies_b;
  vci_flag_out      <= flag_a_implies_b;

  --Byteenables, just pass through
  vci_byteenable    <= vci_byte_valid;
end rtl;
