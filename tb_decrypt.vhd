--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:34:11 03/23/2020
-- Design Name:   
-- Module Name:   C:/Users/Amin92/Desktop/hardware/amin_des/tb_decrypt.vhd
-- Project Name:  amin_des
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decrypt
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_decrypt IS
END tb_decrypt;
 
ARCHITECTURE behavior OF tb_decrypt IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decrypt
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
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decrypt PORT MAP (
          data_in => data_in,
          key => key,
          data_out => data_out
        );

  
 

   -- Stimulus process
   stim_proc: process
   begin		
     data_in<= X"85E813540F0AB405";
	  key<=		X"133457799BBCDFF1";
	
      wait;
   end process;

END;
