library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity GF_Adder is
port(
--------------------------------- Inputs ------------------------------------------
inputA: in std_logic_vector(2 downto 0);
inputB: in std_logic_vector(2 downto 0);
-------------------------------- Outputs ------------------------------------------
output: out std_logic_vector(2 downto 0)
);
end GF_Adder;
architecture adder_behavioral of GF_Adder is
begin
---------------------------------- XOR Stage -------------------------------------
xorStage: process(inputA, inputB)
variable inA : std_logic_vector(2 downto 0);
variable inB : std_logic_vector(2 downto 0);
variable outZ : std_logic_vector(2 downto 0);
begin
inA := inputA;
inB := inputB;
outZ(0) := (inA(0) xor inB(0));
outZ(1) := (inA(1) xor inB(1));
outZ(2) := (inA(2) xor inB(2));
output <= outZ;
end process;
end adder_behavioral;
