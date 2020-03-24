
--Stage 4

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity IP is
port(
data_in:in std_logic_vector(0 to 63);
IP_out: out std_logic_vector(0 to 63)
);
end IP;

architecture Behavioral of IP is
type ip_array IS ARRAY(0 to 63) Of natural;
signal ip_table: ip_array :=
(( 57, 49, 41, 33, 25, 17, 9, 1,
	59, 51, 43, 35, 27, 19, 11, 3,
	61, 53, 45, 37, 29, 21, 13, 5,
	63, 55, 47, 39, 31, 23, 15, 7,
	56, 48, 40, 32, 24, 16, 8, 0,
	58, 50, 42, 34, 26, 18, 10, 2,
	60, 52, 44, 36, 28, 20, 12, 4,
	62, 54, 46, 38, 30, 22, 14, 6));
begin

process(data_in)
begin
for i in data_in'range loop
			IP_out(i)<=data_in(ip_table(i));
		end loop;
end process;

end Behavioral;

