
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity KEY_XOR is
port(
E_R: in std_logic_vector(0 to 47);
K: in std_logic_vector(0 to 47);
Bout: out std_logic_vector(0 to 47)
);
end KEY_XOR;

architecture Behavioral of KEY_XOR is

begin

Bout<= E_R xor K;

end Behavioral;

