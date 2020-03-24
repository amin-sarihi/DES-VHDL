

--STAGE 1


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PC1 is
port(key: in std_logic_vector(0 to 63);
	  key_plus: out std_logic_vector(0 to 55 ));

end PC1;

architecture Behavioral of PC1 is


begin

	key_plus(0)<=key(56);
	key_plus(1)<=key(48);
	key_plus(2)<=key(40);
	key_plus(3)<=key(32);
	key_plus(4)<=key(24);
	key_plus(5)<=key(16);
	key_plus(6)<=key(8);
	
	key_plus(7)<=key(0);
	key_plus(8)<=key(57);
	key_plus(9)<=key(49);
	key_plus(10)<=key(41);
	key_plus(11)<=key(33);
	key_plus(12)<=key(25);
	key_plus(13)<=key(17);
	
	key_plus(14)<=key(9);
	key_plus(15)<=key(1);
	key_plus(16)<=key(58);
	key_plus(17)<=key(50);
	key_plus(18)<=key(42);
	key_plus(19)<=key(34);
	key_plus(20)<=key(26);
	
	key_plus(21)<=key(18);
	key_plus(22)<=key(10);
	key_plus(23)<=key(2);
	key_plus(24)<=key(59);
	key_plus(25)<=key(51);
	key_plus(26)<=key(43);
	key_plus(27)<=key(35);
	
	key_plus(28)<=key(62);
	key_plus(29)<=key(54);
	key_plus(30)<=key(46);
	key_plus(31)<=key(38);
	key_plus(32)<=key(30);
	key_plus(33)<=key(22);
	key_plus(34)<=key(14);
	
	key_plus(35)<=key(6);
	key_plus(36)<=key(61);
	key_plus(37)<=key(53);
	key_plus(38)<=key(45);
	key_plus(39)<=key(37);
	key_plus(40)<=key(29);
	key_plus(41)<=key(21);
	
	key_plus(42)<=key(13);
	key_plus(43)<=key(5);
	key_plus(44)<=key(60);
	key_plus(45)<=key(52);
	key_plus(46)<=key(44);
	key_plus(47)<=key(36);
	key_plus(48)<=key(28);
	
	key_plus(49)<=key(20);
	key_plus(50)<=key(12);
	key_plus(51)<=key(4);
	key_plus(52)<=key(27);
	key_plus(53)<=key(19);
	key_plus(54)<=key(11);
	key_plus(55)<=key(3);
	
	
	
	end Behavioral;