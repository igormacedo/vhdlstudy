--autor: igor macedo silva
--description: generic multiplexer for a generic number of inputs and generic bus size.

library ieee;
use ieee.std_logic_1164.all;

--creation of specifc package for array input
package barramento is
	--constant insize: integer := 4;
	--constant bussize: integer := 4;
	--type int_matrix is array (integer range <>) of std_logic_vector(integer range <>);
	type logic_matrix is array (natural range <>, natural range <>) of std_logic;
end package;

library ieee;
use ieee.std_logic_1164.all;

use work.barramento.all;

entity muxt is
	generic(
		insize: integer := 2;
		bussize: integer := 4
	);
	port(
		--i0, i1, i2, i3	: in bit;4
		--type int_array is array ((insize-1) to 0) of bit_vector((bussize-1) downto 0);
		bar	: in logic_matrix(0 to (insize-1),0 to (bussize-1));
		s		: out std_logic_vector(0 to (bussize-1));
		c		: in integer range 0 to insize-1
	);
end entity;

architecture estrutura of muxt is
begin
	process(c)
	begin
		for i in 0 to (bussize-1) loop
			s(i) <= bar(c,i);
		end loop;
	end process;

end architecture;


--=========================================================================
--autor: igor macedo silva
--description: generic multiplexer for a generic number of inputs and generic bus size.

--creation of specifc package for array input
-- package barramento is
-- 	constant insize: integer := 4;
-- 	constant bussize: integer := 4;
-- 	type int_array is array (integer range <>) of bit_vector(integer range <>);
-- end package;
--
-- use work.barramento.all;
--
-- entity muxt is
-- 	--generic(insize: integer := 4);
-- 	--generic(bussize: integer := 4);
-- 	port(
-- 		--i0, i1, i2, i3	: in bit;
-- 		--type int_array is array ((insize-1) to 0) of bit_vector((bussize-1) downto 0);
-- 		bar	: in int_array;
-- 		s		: out bit_vector((bussize-1) downto 0);
-- 		c		: in integer range insize-1 downto 0
-- 	);
-- end entity;
--
-- architecture estrutura of muxt is
-- begin
-- 	s <= bar(c);
-- end architecture;
