library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rs is
  port (clr : in  std_logic;
        clk : in  std_logic;
        s   : in  std_logic;
        r   : in  std_logic;
        q   : out std_logic);
end rs;

architecture behavioral of rs is

  begin
    process (clr, clk)
    begin
      if (clr = '1') then
        q <= '0';
      elsif (rising_edge(clk)) then
        if (r = '1') then
          q <= '0';
        elsif (s = '1') then
          q <= '1';
        end if;
      end if;
    end process;
  end behavioral;