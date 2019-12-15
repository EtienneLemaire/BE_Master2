library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pwm is
  port (clr : in  std_logic;
        clk : in  std_logic;
        d   : in  std_logic_vector(7 downto 0);
        q   : out std_logic);
end pwm;

architecture behavioral of pwm is

  signal zero     : std_logic;
  signal eq       : std_logic;
  signal internal : std_logic_vector(7 downto 0);

  component cnt16
    port (clr : in  std_logic;
          clk : in  std_logic;
          q   : out std_logic_vector(7 downto 0));
  end component;

  component rs
    port (clr : in  std_logic;
          clk : in  std_logic;
          s   : in  std_logic;
          r   : in  std_logic;
          q   : out std_logic);
  end component;

  component cmp
    port (a   : in  std_logic_vector(7 downto 0);
          b   : in  std_logic_vector(7 downto 0);
          eq  : out std_logic);
  end component;

  begin
    counter  : cnt16 port map (clr, clk, internal);
    cmpzero  : cmp   port map (internal, x"00", zero);
    cmplimit : cmp   port map (internal, d, eq);
    rsc      : rs    port map (clr, clk, zero, eq, q);
  end behavioral;