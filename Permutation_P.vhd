
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Permutation_P is
port(
Sout: in std_logic_vector (0 to 31);
Pout: out std_logic_vector(0 to 31)
);
end Permutation_P;

architecture Behavioral of Permutation_P is

type Permutation IS ARRAY(0 to 31) Of natural;
signal P: Permutation :=
(( 15, 6, 19, 20,
28, 11, 27, 16,
0, 14, 22, 25,
4, 17, 30, 9,
1, 7, 23, 13,
31, 26, 2, 8,
18, 12, 29, 5,
21, 10, 3, 24 ));
	
begin

process(Sout)
begin
for i in Pout'range loop
			Pout(i)<=Sout(P(i));
		end loop;
end process;

end Behavioral;

