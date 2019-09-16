library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity DIV250 is
    Port ( CLOCK_50,reset : in  STD_LOGIC;    -- Horloge 50 Mhz et Reset Asynchrone
           freq : out  STD_LOGIC);         -- Horloge 1 MHz
end DIV250;
 
architecture Behavioral of DIV250 is
 
-- Registre Horloge 50 MHz

signal switch: STD_LOGIC;
signal diviseur : std_logic_vector (24 downto 0);
begin
 
-- Affectation Port de Sortie
 
--------------------------------------------
-- DIVISION PAR 4 DE L'HORLOGE 100 MHZ
process(CLOCK_50,reset)
 
    begin
    
    
     
        if (reset = '1') then
			switch <= '0'; 
            diviseur <= "0000000000000000000000000";  
     
        elsif rising_edge(CLOCK_50) then
				if diviseur = "1011111010111100001000000" then
					 diviseur <= "0000000000000000000000000";
					 switch <= NOT(switch);
				else
					diviseur <= diviseur + '1';
				end if;	
         
        end if;
 
end process;
		freq <= switch;
		
end Behavioral;