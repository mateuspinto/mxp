library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library work;

entity decoder is
  generic (
    LOGN : positive := 5
    );
  port (
    a : in unsigned(LOGN-1 downto 0);
    b : out unsigned(2**LOGN-1 downto 0)
    );
end;
architecture rtl of decoder is
begin
    process (a)
    begin
        b <= (others => '0');
        b(to_integer(a)) <= '1';
    end process;
end rtl;
