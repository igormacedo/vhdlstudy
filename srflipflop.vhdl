library ieee;
use ieee.std_logic_1164.all;

entity counter is
  port(
     sr : in std_logic_vector (1 downto 0);
     clk : in std_logic;
     prs_clr : in std_logic_vector (1 downto 0);
     q, qb : out std_ulogic
  );
end entity;

architecture behavior of counter is
signal aux : std_ulogic;
begin
  process(clk, prs_clr)
  variable q_temp : std_ulogic;
  begin
    if prs_clr = "11" then
      -- Z is only used for detecting occurencies of this case during simulartion
      -- this signal should be X (forced unknown)
      q_temp := 'Z';
    elsif prs_clr = "01" then
      q_temp := '0';
    elsif prs_clr = "10" then
      q_temp := '1';
    elsif rising_edge(clk) then
      case sr is
        when "00" => q_temp := q_temp;
        when "10" => q_temp := '1';
        when "01" => q_temp := '0';
        -- Z is only used for detecting occurencies of this case during simulartion
        -- this signal should be X (forced unknown)
        when others => q_temp := 'Z';
      end case;
    end if;
	  q <= q_temp;
	  aux <= not(q_temp);
  end process;
  qb <= aux;
end architecture;
