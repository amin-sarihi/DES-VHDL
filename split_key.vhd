

--Stage  2


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;


entity split_key is
port(key_plus: in std_logic_vector(0 to 55);
c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16: out std_logic_vector(0 to 27);
d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16: out std_logic_vector(0 to 27));
end split_key;

architecture Behavioral of split_key is
signal c0_signal: std_logic_vector(0 to 27);
signal d0_signal: std_logic_vector(0 to 27);
begin
c0<= key_plus(0 to 27);
d0<= key_plus(28 to 55);

c0_signal<= key_plus(0 to 27);
d0_signal<= key_plus(28 to 55);

c1<= std_logic_vector(unsigned(c0_signal) rol 1);
d1<= std_logic_vector(unsigned(d0_signal) rol 1);

c2<= std_logic_vector(unsigned(c0_signal) rol 2);
d2<= std_logic_vector(unsigned(d0_signal) rol 2);

c3<= std_logic_vector(unsigned(c0_signal) rol 4);
d3<= std_logic_vector(unsigned(d0_signal) rol 4);

c4<= std_logic_vector(unsigned(c0_signal) rol 6);
d4<= std_logic_vector(unsigned(d0_signal) rol 6);

c5<= std_logic_vector(unsigned(c0_signal) rol 8);
d5<= std_logic_vector(unsigned(d0_signal) rol 8);

c6<= std_logic_vector(unsigned(c0_signal) rol 10);
d6<= std_logic_vector(unsigned(d0_signal) rol 10);

c7<= std_logic_vector(unsigned(c0_signal) rol 12);
d7<= std_logic_vector(unsigned(d0_signal) rol 12);

c8<= std_logic_vector(unsigned(c0_signal) rol 14);
d8<= std_logic_vector(unsigned(d0_signal) rol 14);

c9<= std_logic_vector(unsigned(c0_signal) rol 15);
d9<= std_logic_vector(unsigned(d0_signal) rol 15);

c10<= std_logic_vector(unsigned(c0_signal) rol 17);
d10<= std_logic_vector(unsigned(d0_signal) rol 17);

c11<= std_logic_vector(unsigned(c0_signal) rol 19);
d11<= std_logic_vector(unsigned(d0_signal) rol 19);

c12<= std_logic_vector(unsigned(c0_signal) rol 21);
d12<= std_logic_vector(unsigned(d0_signal) rol 21);

c13<= std_logic_vector(unsigned(c0_signal) rol 23);
d13<= std_logic_vector(unsigned(d0_signal) rol 23);

c14<= std_logic_vector(unsigned(c0_signal) rol 25);
d14<= std_logic_vector(unsigned(d0_signal) rol 25);

c15<= std_logic_vector(unsigned(c0_signal) rol 27);
d15<= std_logic_vector(unsigned(d0_signal) rol 27);

c16<= std_logic_vector(unsigned(c0_signal) rol 28);
d16<= std_logic_vector(unsigned(d0_signal) rol 28);



end Behavioral;

