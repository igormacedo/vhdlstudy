library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity counter is
  port(
    clk, rst : in std_logic;
    q : out std_logic_vector(15 downto 0)
  );
end entity;

architecture behavior of counter is
  --signal tmp_q : std_logic_vector(15 downto 0);
begin
  process(clk, rst)
  variable tmp_q :  std_logic_vector(15 downto 0);
  begin
    if rst = '0' then
      tmp_q := (others => '0');
		-- tmp_q <= (others => '0');
    elsif rising_edge(clk) then
      tmp_q := tmp_q + 1;
		-- tmp_q <= tmp_q + 1;
    end if;
	 q <= tmp_q;
  end process;
  -- q <= tmp_q;

end architecture;
