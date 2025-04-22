library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
10
entity RAM_8X3 is
port(
address: in std_logic_vector(2 downto 0); -- Address bus, 3 bits wide
data_in: in std_logic_vector(2 downto 0); -- Data to be written into the RAM, 3 bits wide
write_in: in std_logic; -- Signal indicating a write operation
clock: in std_logic; -- Clock signal
data_out: out std_logic_vector(2 downto 0) -- Data read from the RAM, 3 bits wide
);
end RAM_8X3;
architecture Behavioral of RAM_8X3 is
type ram_array is array (0 to 7) of std_logic_vector(2 downto 0);
signal ram_data: ram_array := (
"000", "001", "010", "011", "100", "101", "110", "111"
);
begin
process(clock)
begin
if rising_edge(clock) then
if write_in = '1' then
ram_data(to_integer(unsigned(address))) <= data_in;
end if;
end if;
end process;
data_out <= ram_data(to_integer(unsigned(address)));
end Behavioral;
