library ieee;
use ieee.std_logic_1164.all;

entity dflipflop is
  port( d, clk  : in std_logic;
        q       : out std_logic );
end entity;

architecture arc of dflipflop is
begin
  process(clk)
  begin
    if(rising_edge(clk)) then
      q <= d;
    end if;
  end process;
end architecture;
