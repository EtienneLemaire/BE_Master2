library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity cnt16 is
  port (clr : in  std_logic;
        clk : in  std_logic;
        q   : out std_logic_vector(7 downto 0));
end cnt16;

architecture behavioral of cnt16 is

  signal internal : std_logic_vector(7 downto 0);

  begin
    process (clr, clk)
    begin
      if (clr = '1') then
        internal <= (others => '0');
      elsif (rising_edge(clk)) then
        internal <= internal + 1;
      end if;
    end process;
    q <= internal;
  end behavioral;