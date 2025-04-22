##Block-5:
VHDL Code:
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
-- Top-level entity declaration
entity Block5 is
Port (
clk : in std_logic;
rst : in std_logic;
address1 : in std_logic_vector(2 downto 0);
data_in1 : in std_logic_vector(2 downto 0);
write_in1 : in std_logic;
address2 : in std_logic_vector(2 downto 0);
data_in2 : in std_logic_vector(2 downto 0);
write_in2 : in std_logic;
second_input : in std_logic_vector(2 downto 0); -- Additional input for
GF_MUL3
final_output : out std_logic_vector(2 downto 0)
);
end Block5;
architecture Structural of Block5 is
-- Signal Declarations
signal block4_output, mul3_output : std_logic_vector(2 downto 0);
-- Component Declarations
component Block4
port(
clk : in std_logic;
rst : in std_logic;
address1 : in std_logic_vector(2 downto 0);
data_in1 : in std_logic_vector(2 downto 0);
write_in1 : in std_logic;
address2 : in std_logic_vector(2 downto 0);
data_in2 : in std_logic_vector(2 downto 0);
write_in2 : in std_logic;
final_output : out std_logic_vector(2 downto 0)
25
);
end component;
component GF_MUL3
port(
inputA : in std_logic_vector(2 downto 0);
inputB : in std_logic_vector(2 downto 0);
output : out std_logic_vector(2 downto 0)
);
end component;
component GF_Adder_2
port(
inputA : in std_logic_vector(2 downto 0);
inputB : in std_logic_vector(2 downto 0);
output_adder2 : out std_logic_vector(2 downto 0)
);
end component;
begin
-- Instantiate Block4
block4_inst: Block4 port map (
clk => clk,
rst => rst,
address1 => address1,
data_in1 => data_in1,
write_in1 => write_in1,
address2 => address2,
data_in2 => data_in2,
write_in2 => write_in2,
final_output => block4_output
);
-- Instantiate GF_MUL3
mul3_inst: GF_MUL3 port map (
inputA => block4_output,
inputB => second_input,
output => mul3_output
);
-- Instantiate GF_Adder_2
adder2_inst: GF_Adder_2 port map (
inputA => mul3_output,
inputB => second_input, -- Assuming a scenario where the same input is
used for both operations
26
output_adder2 => final_output
);
end Structural;
