library ieee;
use ieee.std_logic_1164.all;

entity shifter is
  port( serial_in, cp   : in     std_logic;
        q0     : out     std_logic);
end entity;

architecture arc of shifter is
	signal aux3, aux2, aux1 :  std_logic;
  component dflipflop
    port( d, clk  : in std_logic;
          q       : out std_logic );
  end component;
begin
  ff3: dflipflop port map (d=>serial_in, clk=>cp, q=> aux3);
  ff2: dflipflop port map (d=>aux3, clk=>cp, q=> aux2);
  ff1: dflipflop port map (d=>aux2, clk=>cp, q=> aux1);
  ff0: dflipflop port map (d=>aux1, clk=>cp, q=> q0);
end architecture;
