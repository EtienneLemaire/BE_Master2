library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
--------------------------------------
 ENTITY bascule_D IS
PORT (sig_1Hz, reset, continu,start_stop: IN STD_LOGIC;
d : IN std_logic_vector (7 downto 0);
data_valid : out std_logic;
q: OUT std_logic_vector (7 downto 0));

END bascule_D;
--------------------------------------
ARCHITECTURE behavior OF bascule_D IS
signal once : std_logic ;
signal check : std_logic_vector (7 downto 0);

BEGIN
PROCESS (sig_1Hz, reset)
BEGIN




case continu is

	when '1' =>
	
		if( check = d) then
			data_valid <= '1';
		else
			data_valid <= '0';
		end if;
		
		IF (reset='0') THEN
			q <= "00000000";
			check <= "00000000";
		ELSIF (sig_1Hz'EVENT AND sig_1Hz='1') THEN
		
			q <= d;
			check <= d;
		END IF;
		once <= '0';
	when '0' => 
			if(once = '0') then
				q <= d;
				data_valid <= '1';
			end if;
			once <= '1';
			
end case;	

if (start_stop = '0') then
	data_valid <= '0';	
end if;

END PROCESS;
END behavior; 