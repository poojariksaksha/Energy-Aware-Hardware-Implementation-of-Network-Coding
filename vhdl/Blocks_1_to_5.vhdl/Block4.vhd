##Block-4:
VHDL Code:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity Block4 is
Port (
clk : in std_logic;
rst : in std_logic;
22
address1 : in std_logic_vector(2 downto 0);
data_in1 : in std_logic_vector(2 downto 0);
write_in1 : in std_logic;
address2 : in std_logic_vector(2 downto 0);
data_in2 : in std_logic_vector(2 downto 0);
write_in2 : in std_logic;
final_output : out std_logic_vector(2 downto 0)
);
end Block4;
architecture Structural of Block4 is
-- Signal Declarations
signal output_from_block1, output_from_block2 : std_logic_vector(2 downto
0);
-- Component Declarations
component Block1
port(
clk : in std_logic;
rst : in std_logic;
write_in : in std_logic;
address : in std_logic_vector(2 downto 0);
data_in : in std_logic_vector(2 downto 0);
result_out: out std_logic_vector(2 downto 0)
);
end component;
component Block2
port(
clk : in std_logic;
rst : in std_logic;
write_in : in std_logic;
address : in std_logic_vector(2 downto 0);
data_in : in std_logic_vector(2 downto 0);
result_out: out std_logic_vector(2 downto 0)
);
end component;
component GF_Adder_1
port(
inputA : in std_logic_vector(2 downto 0);
inputB : in std_logic_vector(2 downto 0);
output_adder1: out std_logic_vector(2 downto 0)
);
end component;
23
begin
-- Instantiate Block1
block1_inst: Block1 port map (
clk => clk,
rst => rst,
write_in => write_in1,
address => address1,
data_in => data_in1,
result_out=> output_from_block1
);
-- Instantiate Block2
block2_inst: Block2 port map (
clk => clk,
rst => rst,
write_in => write_in2,
address => address2,
data_in => data_in2,
result_out => output_from_block2
);
-- Instantiate GF_Adder_1
gf_adder_inst: GF_Adder_1 port map (
inputA => output_from_block1,
inputB => output_from_block2,
output_adder1=> final_output
);
end Structural;
