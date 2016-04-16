library ieee;
use ieee.std_logic_1164.all;

entity srff is
  port(
     s,r : in std_logic;
     clk : in std_logic;
     prs, clr : in std_logic;
     q, qb : out std_logic
  );
end entity;

architecture behavior of srff is
begin
  process(clk,clr,prs)
  begin
    if clr = '1' then
      q <= '0';
    elsif prs = '1' then
      q <= '1';
    elsif rising_edge(clk) then

    end if;
  end process;
  qb <= not(q);
end architecture;
