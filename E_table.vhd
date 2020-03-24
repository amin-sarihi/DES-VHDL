
--Stage 6

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity E_table is
port(R: in std_logic_vector(0 to 31);
	  E_R: out std_logic_vector(0 to 47));
end E_table;

architecture Behavioral of E_table is
type E_array IS ARRAY(0 to 47) Of natural;
signal E_table: E_array :=
(( 31, 0, 1, 2, 3, 4,
	3, 4, 5, 6, 7, 8,
	7, 8, 9, 10, 11, 12,
	11, 12, 13, 14, 15, 16,
	15, 16, 17, 18, 19, 20,
	19, 20, 21, 22, 23, 24,
	23, 24, 25, 26, 27, 28,
	27, 28, 29, 30, 31, 0));
begin

process(R)
begin
for i in E_R'range loop
			E_R(i)<=R(E_table(i));
		end loop;
end process;

end Behavioral;

