-- Ce programme permet de diviser la frequence de 50MHz en 7 frequence entre 250 et 1 Hz

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity DIV250 is
    Port ( CLOCK_50,reset : in  STD_LOGIC;    -- Horloge 50 Mhz et Reset Asynchrone
           in_freq_anemometre : std_logic_vector (2 downto 0);
           freq : out  STD_LOGIC);         -- Horloge 1 MHz
end DIV250;
 
architecture Behavioral of DIV250 is
 
-- Registre Horloge 50 MHz

signal switch: STD_LOGIC;
signal diviseur : std_logic_vector (24 downto 0);
signal compteur : std_logic_vector (24 downto 0);
begin
 
-- Affectation Port de Sortie
 
--------------------------------------------
-- DIVISION PAR 4 DE L'HORLOGE 100 MHZ
process(CLOCK_50,reset)
 
    begin
    
 case in_freq_anemometre is
  when "000" =>  compteur <= "1011111010111100001000000";  
  when "001" =>  compteur <= "0000001111010000100100000"; 
  when "010" =>  compteur <= "0000001010001011000010101";
  when "011" =>  compteur <= "0000000111101000010010000";
  when "100" =>  compteur <= "0000000101000101100001010";
  when "101" =>  compteur <= "0000000011110100001001000";
  when "110" =>  compteur <= "0000000011000011010100000";
  when others =>  compteur <= "1011111010111100001000000";
end case;
    
     
        if (reset = '1') then
			switch <= '0'; 
            diviseur <= "0000000000000000000000000";  
     
        elsif rising_edge(CLOCK_50) then
				if diviseur = compteur then
					 diviseur <= "0000000000000000000000000";
					 switch <= NOT(switch);
				else
					diviseur <= diviseur + '1';
				end if;	
         
        end if;
 
end process;
		freq <= switch;
		
end Behavioral;

