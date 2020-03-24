Library IEEE;
USE IEEE.Std_logic_1164.all;

entity RisingEdge_DFlipFlop is 
   port(
      Q : out std_logic_vector(0 to 31);    
      Clk :in std_logic;   
      D :in  std_logic_vector(0 to 31)    
   );
end RisingEdge_DFlipFlop;
architecture Behavioral of RisingEdge_DFlipFlop is  
begin  
 process(Clk)
 begin 
    if(rising_edge(Clk)) then
   Q <= D; 
    end if;       
 end process;  
end Behavioral; 