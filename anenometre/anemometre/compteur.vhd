library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_arith;


entity compteur is
    Port ( in_freq_anemometre,sig_1Hz, reset,continu : in  STD_LOGIC;    -- Horloge 50 Mhz et Reset Asynchrone
           freq_signal : out  std_logic_vector (7 downto 0));         -- Horloge 1 MHz
end compteur;
 
architecture Behavioral of compteur is
 
-- Registre Horloge 50 MHz

signal compteur_8bits : std_logic_vector (7 downto 0);
signal result : std_logic_vector (7 downto 0);
signal Hz_reset : STD_LOGIC;
begin
 
-- Affectation Port de Sortie

--------------------------------------------
-- DIVISION PAR 4 DE L'HORLOGE 100 MHZ
process(sig_1Hz)
		begin
		if (sig_1Hz='1') then
			Hz_reset <= '1';
			
		else 
			
			Hz_reset <= '0';
		end if;
end process;

process(in_freq_anemometre, reset)
 
    begin
    

        if (reset = '0') then
            compteur_8bits <= "00000000";  
     
        elsif (Hz_reset = '0') then
			result <= compteur_8bits+compteur_8bits;	
			compteur_8bits <= "00000000"; 		
		else
			if rising_edge(in_freq_anemometre) then
					compteur_8bits <= compteur_8bits + '1';
			end if;
		end if;

		
end process;
freq_signal <= compteur_8bits+compteur_8bits;
		
end Behavioral;