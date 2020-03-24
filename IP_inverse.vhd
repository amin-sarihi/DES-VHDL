
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity IP_inverse is
port(R16,L16: in std_logic_vector(0 to 31);
	  data_out: out std_logic_vector(0 to 63)
);
end IP_inverse;

architecture Behavioral of IP_inverse is

type ip_array IS ARRAY(0 to 63) Of natural;
signal ip_table: ip_array :=
(( 39 ,7 ,47 ,15 ,55 ,23 ,63 ,31,
	38 ,6 ,46 ,14 ,54 ,22 ,62 ,30,
	37 ,5 ,45 ,13 ,53 ,21 ,61 ,29,
	36 ,4 ,44 ,12 ,52 ,20 ,60 ,28,
	35 ,3 ,43 ,11 ,51 ,19 ,59 ,27,
	34 ,2 ,42 ,10 ,50 ,18 ,58 ,26,
	33 ,1 ,41 ,9 ,49 ,17 ,57 ,25,
	32 ,0 ,40 ,8 ,48 ,16 ,56 ,24 ));
Signal inter: std_logic_vector(0 to 63);

begin

inter<=R16&L16;

process(inter)
begin
for i in data_out'range loop
			data_out(i)<=inter(ip_table(i));
		end loop;
end process;


end Behavioral;

