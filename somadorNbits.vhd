entity somadornbits is
	generic(n: integer := 32);
	port(
		a, b	: in bit_vector(n-1 downto 0);
		te		: in bit;
		s		: out bit_vector(n-1 downto 0);
		ts		: out bit
	);

end entity;

architecture estrutura of somadornbits is
signal t: bit_vector(n downto 0);
begin
	process(a,b,t,te)
	begin
		t(0) <= te;
		for i in 0 to n-1 loop
			s(i) <= a(i) xor (b(i) xor t(i));
			t(i+1) <= (a(i) and b(i)) or (a(i) and t(i)) or (b(i) and t(i));
		end loop;

		ts <= t(n);
		--t(0) <= te;
		--s(0) <= a(0) xor b(0) xor t(0);
		--t(1) <= (a(0) and b(0)) or (a(0) and t(0)) or (b(0) and t(0));
		--s(1) <= a(1) xor b(1) xor t(1);
		--t(2) <= (a(1) and b(1)) or (a(1) and t(1)) or (b(1) and t(1));
		--ts <= t(2);
	end process;
end architecture;
