
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity SBOX is
port(
Bout: in std_logic_vector(0 to 47);
Sout: out std_logic_vector(0 to 31)
);
end SBOX;

architecture Behavioral of SBOX is

signal B1,B2,B3,B4,B5,B6,B7,B8: std_logic_vector(0 to 3);
signal row1,row2,row3,row4,row5,row6,row7,row8:natural;
signal pre_row1,pre_row2,pre_row3,pre_row4,pre_row5,pre_row6,pre_row7,pre_row8: std_logic_vector(1 downto 0);
signal col1,col2,col3,col4,col5,col6,col7,col8: natural;
type S_box IS ARRAY(0 to 63) Of natural;
signal S1: S_box :=
(( 14, 4, 13, 1, 2, 15, 11, 8, 3, 10, 6, 12, 5, 9, 0 ,7,
	0, 15, 7, 4, 14,  2, 13, 1, 10, 6, 12, 11, 9, 5, 3, 8,
	4, 1, 14, 8, 13, 6, 2, 11, 15, 12, 9, 7, 3, 10, 5, 0,
	15, 12, 8, 2, 4, 9, 1, 7, 5, 11, 3, 14, 10, 0, 6, 1 ));
	
signal S2: S_box :=
(( 15,1,8,14,6,11,3,4,9,7,2,13,12,0,5,10,
	3,13,4,7,15,2,8,14,12,0,1,10,6,9,11,5,
	0,14,7,11,10,4,13,1,5,8,12,6,9,3,2,15,
	13,8,10,1,3,15,4,2,11,6,7,12,0,5,14,9));	

signal S3: S_box :=
(( 10,0,9,14,6,3,15,5,1,13,12,7,11,4,2,8,
	13,7,0,9,3,4,6,10,2,8,5,14,12,11,15,1,
	13,6,4,9,8,15,3,0,11,1,2,12,5,10,14,7,
	1,10,13,0,6,9,8,7,4,15,14,3,11,5,2,12 ));	

signal S4: S_box :=
(( 7, 13, 14, 3, 0, 6, 9, 10,1,2,8,5,11,12,4,15,
	13,8,11,5,6,15,0,3,4,7,2,12,1,10,14,9,
	10,6,9,0,12,11,7,13,15,1,3,14,5,2,8,4,
	3,15,0,6,10,1,13,8,9,4,5,11,12,7,2,14 ));	

signal S5: S_box :=
(( 2,12,4,1,7,10,11,6,8,5,3,15,13,0,14,9,
	14,11,2,12,4,7,13,1,5,0,15,10,3,9,8,6,
	4,2,1,11,10,13,7,8,15,9,12,5,6,3,0,14,
	11,8,12,7,1,14,2,13,6,15,0,9,10,4,5,3 ));	

signal S6: S_box :=
(( 12,1,10,15,9,2,6,8,0,13,3,4,14,7,5,11,
	10,15,4,2,7,12,9,5,6,1,13,14,0,11,3,8,
	9,14,15,5,2,8,12,3,7,0,4,10,1,13,11,6,
	4,3,2,12,9,5,15,10,11,14,1,7,6,0,8,13 ));	

signal S7: S_box :=
(( 4,11,2,14,15,0,8,13,3,12,9,7,5,10,6,1,
	13,0,11,7,4,9,1,10,14,3,5,12,2,15,8,6,
	1,4,11,13,12,3,7,14,10,15,6,8,0,5,9,2,
	6,11,13,8,1,4,10,7,9,5,0,15,14,2,3,12 ));	

signal S8: S_box :=
(( 13, 2, 8, 4, 6, 15,11,1,10,9,3,14,5,0,12,7,
	1,15,13,8,10,3,7,4,12,5,6,11,0,14,9,2,
	7,11,4,1,9,12,14,2,0,6,10,13,15,3,5,8,
	2,1,14,7,4,10,8,13,15,12,9,0,3,5,6,11 ));	

begin
pre_row1<=Bout(0)  & Bout(5);
pre_row2<=Bout(6)  & Bout (11);
pre_row3<=Bout(12) & Bout (17);
pre_row4<=Bout(18) & Bout (23);
pre_row5<=Bout(24) & Bout (29);
pre_row6<=Bout(30) & Bout (35);
pre_row7<=Bout(36) & Bout (41);
pre_row8<=Bout(42) & Bout (47);
row1 <= to_integer(unsigned(pre_row1));
row2 <= to_integer(unsigned(pre_row2));
row3 <= to_integer(unsigned(pre_row3));
row4 <= to_integer(unsigned(pre_row4));
row5 <= to_integer(unsigned(pre_row5));
row6 <= to_integer(unsigned(pre_row6));
row7 <= to_integer(unsigned(pre_row7));
row8 <= to_integer(unsigned(pre_row8));

col1 <= to_integer(unsigned(Bout(1 to 4)));
col2 <= to_integer(unsigned(Bout(7 to 10)));
col3 <= to_integer(unsigned(Bout(13 to 16)));
col4 <= to_integer(unsigned(Bout(19 to 22)));
col5 <= to_integer(unsigned(Bout(25 to 28)));
col6 <= to_integer(unsigned(Bout(31 to 34)));
col7 <= to_integer(unsigned(Bout(37 to 40)));
col8 <= to_integer(unsigned(Bout(43 to 46)));

B1<= std_logic_vector(to_unsigned(S1(row1*16+col1),B1'length));
B2<= std_logic_vector(to_unsigned(S2(row2*16+col2),B2'length));
B3<= std_logic_vector(to_unsigned(S3(row3*16+col3),B3'length));
B4<= std_logic_vector(to_unsigned(S4(row4*16+col4),B4'length));
B5<= std_logic_vector(to_unsigned(S5(row5*16+col5),B5'length));
B6<= std_logic_vector(to_unsigned(S6(row6*16+col6),B6'length));
B7<= std_logic_vector(to_unsigned(S7(row7*16+col7),B7'length));
B8<= std_logic_vector(to_unsigned(S8(row8*16+col8),B8'length));

Sout<= B1&B2&B3&B4&B5&B6&B7&B8;

end Behavioral;

