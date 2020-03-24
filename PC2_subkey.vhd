
--Stage 3

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;



entity sub_key is
port(c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16:
 in std_logic_vector(0 to 27);
	  d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16: 
	  in std_logic_vector(0 to 27);
sub_key_1,sub_key_2,sub_key_3,sub_key_4,sub_key_5,sub_key_6,sub_key_7,sub_key_8,
sub_key_9,sub_key_10,sub_key_11,sub_key_12,sub_key_13,sub_key_14,sub_key_15,sub_key_16
: out std_logic_vector(0 to 47)
);
end sub_key;

architecture Behavioral of sub_key is
type pc2_array IS ARRAY(0 to 47) Of natural;
signal pc2: pc2_array :=
(( 13, 16, 10, 23, 0, 4,
	2, 27, 14, 5, 20, 9,
	22, 18, 11, 3, 25, 7,
	15, 6, 26, 19, 12, 1,
	40, 51, 30, 36, 46, 54,
	29, 39, 50, 44, 32, 47,
	43, 48, 38, 55, 33, 52,
	45, 41, 49, 35, 28, 31));
signal c1d1_signal,c2d2_signal,c3d3_signal,c4d4_signal,c5d5_signal,c6d6_signal,c7d7_signal,c8d8_signal,c9d9_signal,c10d10_signal,c11d11_signal,c12d12_signal,c13d13_signal,c14d14_signal,c15d15_signal,c16d16_signal: std_logic_vector(0 to 55);
begin
c1d1_signal<=c1&d1;
c2d2_signal<=c2&d2;
c3d3_signal<=c3&d3;
c4d4_signal<=c4&d4;
c5d5_signal<=c5&d5;
c6d6_signal<=c6&d6;
c7d7_signal<=c7&d7;
c8d8_signal<=c8&d8;
c9d9_signal<=c9&d9;
c10d10_signal<=c10&d10;
c11d11_signal<=c11&d11;
c12d12_signal<=c12&d12;
c13d13_signal<=c13&d13;
c14d14_signal<=c14&d14;
c15d15_signal<=c15&d15;
c16d16_signal<=c16&d16;

process (c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16,c1d1_signal,c2d2_signal,c3d3_signal,c4d4_signal,c5d5_signal,c6d6_signal,c7d7_signal,c8d8_signal,c9d9_signal,c10d10_signal,c11d11_signal,c12d12_signal,c13d13_signal,c14d14_signal,c15d15_signal,c16d16_signal,pc2)
begin

for i in sub_key_1'range loop
			sub_key_1(i)<=c1d1_signal(pc2(i));
		end loop;

for i in sub_key_2'range loop
			sub_key_2(i)<=c2d2_signal(pc2(i));
		end loop;

for i in sub_key_3'range loop
			sub_key_3(i)<=c3d3_signal(pc2(i));
		end loop;

for i in sub_key_4'range loop
			sub_key_4(i)<=c4d4_signal(pc2(i));
		end loop;

for i in sub_key_5'range loop
			sub_key_5(i)<=c5d5_signal(pc2(i));
		end loop;

for i in sub_key_6'range loop
			sub_key_6(i)<=c6d6_signal(pc2(i));
		end loop;

for i in sub_key_7'range loop
			sub_key_7(i)<=c7d7_signal(pc2(i));
		end loop;

for i in sub_key_8'range loop
			sub_key_8(i)<=c8d8_signal(pc2(i));
		end loop;
		
for i in sub_key_9'range loop
			sub_key_9(i)<=c9d9_signal(pc2(i));
		end loop;


for i in sub_key_10'range loop
			sub_key_10(i)<=c10d10_signal(pc2(i));
		end loop;

for i in sub_key_11'range loop
			sub_key_11(i)<=c11d11_signal(pc2(i));
		end loop;

for i in sub_key_12'range loop
			sub_key_12(i)<=c12d12_signal(pc2(i));
		end loop;

for i in sub_key_13'range loop
			sub_key_13(i)<=c13d13_signal(pc2(i));
		end loop;

for i in sub_key_14'range loop
			sub_key_14(i)<=c14d14_signal(pc2(i));
		end loop;

for i in sub_key_15'range loop
			sub_key_15(i)<=c15d15_signal(pc2(i));
		end loop;
		
for i in sub_key_16'range loop
			sub_key_16(i)<=c16d16_signal(pc2(i));
		end loop;


end process;


end Behavioral;

