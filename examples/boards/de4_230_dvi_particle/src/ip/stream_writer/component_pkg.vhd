-- Aaron Severance
-- component_pkg.vhd
-- Copyright (C) 2012-2015 VectorBlox Computing, Inc.

-- Component declarations

-- synthesis library stream_writer_lib
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;
use work.util_pkg.all;
use work.architecture_pkg.all;

package component_pkg is
  component fwft_fifo_reg
    generic (
      WIDTH             : integer := 32;
      DEPTH             : integer := 16;
      ALMOST_FULL_VALUE : integer := 4;
      EXTERNAL_REGISTER : boolean := false
      );
    port
      (
        clk   : in std_logic;
        reset : in std_logic;

        rdreq     : in std_logic;
        wrreq     : in std_logic;
        writedata : in std_logic_vector(WIDTH-1 downto 0);

        almost_full  : out std_logic;
        usedw        : out std_logic_vector(log2(DEPTH)-1 downto 0);
        head_invalid : out std_logic;
        empty        : out std_logic;
        full         : out std_logic;
        readdata     : out std_logic_vector(WIDTH-1 downto 0)
        );
  end component;

  component buffer_list
    generic (
      BUFFER_LIST_ENTRIES : positive := 4
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
  end component;
end package;

package body component_pkg is
end component_pkg;
