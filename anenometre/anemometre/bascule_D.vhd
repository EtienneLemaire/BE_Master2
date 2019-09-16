library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
--------------------------------------
 ENTITY bascule_D IS
PORT (clk, rst: IN STD_LOGIC;
d : IN std_logic_vector (7 downto 0);
q: OUT std_logic_vector (7 downto 0));
END bascule_D;
--------------------------------------
ARCHITECTURE behavior OF bascule_D IS
BEGIN
PROCESS (clk, rst)
BEGIN
IF (rst='1') THEN
q <= "00000000";
ELSIF (clk'EVENT AND clk='1') THEN
q <= d;
END IF;
END PROCESS;
END behavior; 