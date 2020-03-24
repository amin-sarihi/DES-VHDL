
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity RL_next is
port(R_current,L_current: in std_logic_vector(0 to 31);
Pout : in std_logic_vector(0 to 31);
R_next,L_next: out std_logic_vector(0 to 31)
);
end RL_next;

architecture Behavioral of RL_next is

begin
R_next<= L_current xor Pout;
L_next<= R_current;

end Behavioral;

