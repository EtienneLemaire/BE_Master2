library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cmp is
  port (a   : in  std_logic_vector(7 downto 0);
        b   : in  std_logic_vector(7 downto 0);
        eq  : out std_logic);
end cmp;

architecture behavioral of cmp is

  begin
    eq <= '1' when (a = b) else
          '0';
  end behavioral;