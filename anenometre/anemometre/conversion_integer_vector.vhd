library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity conversion_integer_vector is
    Port ( in_freq_anemometre : in  integer;    -- Horloge 50 Mhz et Reset Asynchrone
           data_anemometre : out  std_logic_vector (7 downto 0));       -- Horloge 1 MHz
end conversion_integer_vector;

 
architecture Behavioral of conversion_integer_vector is
 
-- Registre Horloge 50 MHz
signal input_1   : integer;
signal output_1   : std_logic_vector (7 downto 0);
begin
 
-- Affectation Port d'entr�e
input_1 <= in_freq_anemometre;
--------------------------------------------
-- DIVISION PAR 4 DE L'HORLOGE 100 MHZ
	process(in_freq_anemometre)
	 
		begin
		   
		   
	output_1 <= std_logic_vector(to_unsigned(input_1, output_1'length));
	 
	end process;
-- Affectation Port de sortie	
data_anemometre <= output_1; 
		
end Behavioral;