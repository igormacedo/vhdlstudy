ENTITY somadorNbits IS
	GENERIC(N: INTEGER := 32);
	PORT(
		A, B	: IN BIT_VECTOR(N-1 DOWNTO 0);
		Te		: IN BIT;
		S		: OUT BIT_VECTOR(N-1 DOWNTO 0);
		Ts		: OUT BIT
	);

END ENTITY;

ARCHITECTURE estrutura OF somadorNbits IS
SIGNAL T: BIT_VECTOR(N DOWNTO 0);
BEGIN
	PROCESS(A,B,T,Te)
	BEGIN
		T(0) <= Te;
		FOR i IN 0 TO N-1 LOOP
			S(i) <= A(i) XOR (B(i) XOR T(i));
			T(i+1) <= (A(i) AND B(i)) OR (A(i) AND T(i)) OR (B(i) AND T(i));
		END LOOP;

		Ts <= T(N);
		--T(0) <= Te;
		--S(0) <= A(0) XOR B(0) XOR T(0);
		--T(1) <= (A(0) AND B(0)) OR (A(0) AND T(0)) OR (B(0) AND T(0));
		--S(1) <= A(1) XOR B(1) XOR T(1);
		--T(2) <= (A(1) AND B(1)) OR (A(1) AND T(1)) OR (B(1) AND T(1));
		--Ts <= T(2);
	END PROCESS;
END ARCHITECTURE;
