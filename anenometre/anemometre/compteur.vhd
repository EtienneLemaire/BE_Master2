library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity freq1Hz is
    Port ( in_freq_anemometre,sig_1Hz : in  STD_LOGIC;    -- Horloge 50 Mhz et Reset Asynchrone
           freq_signal : out  std_logic_vector (7 downto 0));         -- Horloge 1 MHz
end freq1Hz;
 
architecture Behavioral of freq1Hz is
 
-- Registre Horloge 50 MHz

signal switch: STD_LOGIC;
signal compteur : std_logic_vector (7 downto 0);
begin
 
-- Affectation Port de Sortie

--------------------------------------------
-- DIVISION PAR 4 DE L'HORLOGE 100 MHZ
process(CLOCK_50,reset)
 
    begin
    
    
     
        if (reset = '1') then
            compteur <= "00000000";  
     
        elsif rising_edge(sig_1Hz) then
			freq_signal <= compteur; 
			compteur <= "00000000"; 
				
		else
         if rising_edge(in_freq_anemometre) then
					compteur <= compteur + '1';
		 end if;
        end if;
 
end process;
		
		
end Behavioral;