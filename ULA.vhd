library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
--use ieee.std_logic_signed.all;
use ieee.std_logic_unsigned.all;

entity ula is
generic(n : integer := 4);

port(
	e : in integer range 0 to n-1;
	a : in std_logic_vector(n-1 downto 0);
	b : in std_logic_vector(n-1 downto 0);

	s : out std_logic_vector(2*n-1 downto 0)
);

end entity;

architecture estrutura of ula is

signal aux : std_logic_vector(n-1 downto 0);

begin
	aux <= (others => '0');
	with e select
		s <= 	aux & (a+b) when 0,
					a*b when 1,
					aux & (a xor b) when 2,
					aux & (a and b) when 3;
end architecture;
