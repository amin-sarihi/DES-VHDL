library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2_1 is
port(in1,in2:in std_logic_vector(0 to 31);
s: in std_logic;
output: out std_logic_vector(0 to 31));
end mux_2_1;

architecture Behavioral of mux_2_1 is

begin
output<= in1 when s='0' else
			in2;
end behavioral;