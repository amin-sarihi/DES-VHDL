
--Stage 5

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity RL_Split is
port(
IP_out: in std_logic_vector(0 to 63);
R:out std_logic_vector(0 to 31);
L:out std_logic_vector(32 to 63)
);
end RL_Split;

architecture Behavioral of RL_Split is

begin
L<= IP_out(0 to 31);
R<= IP_out(32 to 63);

end Behavioral;

