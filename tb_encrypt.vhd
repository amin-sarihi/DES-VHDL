
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY tb_DES IS
END tb_DES;
 
ARCHITECTURE behavior OF tb_DES IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT encrypt
    PORT(
         data_in : IN  std_logic_vector(0 to 63);
         key : IN  std_logic_vector(0 to 63);
         data_out : OUT  std_logic_vector(0 to 63)
        );
    END COMPONENT;
    

   --Inputs
   signal data_in : std_logic_vector(0 to 63) := (others => '0');
   signal key : std_logic_vector(0 to 63) := (others => '0');
   

 	--Outputs
   signal data_out : std_logic_vector(0 to 63);

   -- Clock period definitions
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: encrypt PORT MAP (
          data_in => data_in,
          key => key,
          data_out => data_out
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
      	

      data_in<=X"0123456789ABCDEF";
		key<=		X"133457799BBCDFF1";
		 

      wait;
   end process;

END;
