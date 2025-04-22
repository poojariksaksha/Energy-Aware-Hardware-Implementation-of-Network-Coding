library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity gf_multiplier is
port(
inputA: in std_logic_vector(2 downto 0);
inputB: in std_logic_vector(2 downto 0);
output: out std_logic_vector(2 downto 0)
);
end gf_multiplier;
architecture Behavioral of gf_multiplier is
begin
---------------------------------- XOR Stage -------------------------------------
xorStage: process(inputA, inputB)
variable inA : std_logic_vector(2 downto 0);
variable inB : std_logic_vector(2 downto 0);
13
variable outZ : std_logic_vector(2 downto 0);
begin
inA := inputA;
inB := inputB;
outZ(0) := (inA(2) and inB(2)) xor (inA(2) and inB(1)) xor (inA(1) and inB(2)) xor (inA(0)
and inB(0));
outZ(1) := (inA(2) and inB(2)) xor (inA(1) and inB(0)) xor (inA(0) and inB(1));
outZ(2) := (inA(2) and inB(2)) xor (inA(2) and inB(1)) xor (inA(1) and inB(2)) xor (inA(2)
and inB(0)) xor (inA(1) and inB(1)) xor (inA(0) and inB(2));
output <= outZ;
end process;
end Behavioral;
