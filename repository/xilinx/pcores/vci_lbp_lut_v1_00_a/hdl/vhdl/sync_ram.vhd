library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;

entity sync_ram is
    generic (
        BYTES : positive := 1;
        LOGN : positive := 8
    );
    port (
        clk: in std_logic;
        we   : in std_logic;
        address : in std_logic_vector(LOGN-1 downto 0);
        data_in : in std_logic_vector(BYTES*8-1 downto 0);
        data_out : out std_logic_vector(BYTES*8-1 downto 0)
    );
end entity sync_ram;

architecture rtl of sync_ram is
    type ram_type is array(0 to 2**LOGN-1) of std_logic_vector(data_in'range);
    signal ram : ram_type;
    signal read_address : std_logic_vector(LOGN-1 downto 0);

begin
    process(clk) is
    begin
        if rising_edge(clk) then
            if we = '1' then
                ram(to_integer(unsigned(address))) <= data_in;
            end if;
            read_address <= address;
        end if;
    end process;

    data_out <= ram(to_integer(unsigned(read_address)));
end rtl;
