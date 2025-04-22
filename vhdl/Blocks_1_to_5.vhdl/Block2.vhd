##Block-2:
VHDL Code:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity Block2 is
port(
clk : in std_logic;
rst : in std_logic;
write_in : in std_logic;
address : in std_logic_vector(2 downto 0);
data_in : in std_logic_vector(2 downto 0);
result_out : out std_logic_vector(2 downto 0)
);
end Block2;
architecture structural_Block2 of Block2 is
-- Component Declarations
component RAM2_8X3
port(
address : in std_logic_vector(2 downto 0);
18
data_in : in std_logic_vector(2 downto 0);
write_in : in std_logic;
clock : in std_logic;
data_out : out std_logic_vector(2 downto 0)
);
end component;
component LFSR2
port(
clk : in std_logic;
rst : in std_logic;
outp : out std_logic_vector(2 downto 0)
);
end component;
component GF_MUL2
port(
inputA : in std_logic_vector(2 downto 0);
inputB : in std_logic_vector(2 downto 0);
output : out std_logic_vector(2 downto 0)
);
end component;
-- Signal Declarations
signal ram_output, lfsr_output : std_logic_vector(2 downto 0);
-- Component Instances
begin
inst_ram : RAM2_8X3
port map(
address => address,
data_in => data_in,
write_in => write_in,
clock => clk,
data_out => ram_output
);
inst_lfsr : LFSR2
port map(
clk => clk,
rst => rst,
outp => lfsr_output
);
inst_gfmul : GF_MUL2
port map(
19
inputA => ram_output,
inputB => lfsr_output,
output => result_out
);
end structural_Block2;
