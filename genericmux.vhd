--Autor: Igor Macedo Silva
--Description: Generic multiplexer for a generic number of inputs and generic bus size.

--Creation of specifc package for array input
PACKAGE barramento IS
	CONSTANT INSIZE: INTEGER := 4;
	CONSTANT BUSSIZE: INTEGER := 4;
	TYPE INT_ARRAY IS ARRAY (0 TO INSIZE-1) OF BIT_VECTOR(0 TO BUSSIZE-1);
END PACKAGE;

use work.barramento.all;

ENTITY muxNbits IS
	--GENERIC(INSIZE: INTEGER := 4);
	--GENERIC(BUSSIZE: INTEGER := 4);
	PORT(
		--i0, i1, i2, i3	: IN BIT;
		--TYPE INT_ARRAY IS ARRAY ((INSIZE-1) TO 0) OF BIT_VECTOR((BUSSIZE-1) DOWNTO 0);
		bar	: IN INT_ARRAY;
		S		: OUT BIT_VECTOR((BUSSIZE-1) DOWNTO 0);
		C		: IN INTEGER RANGE INSIZE-1 DOWNTO 0
	);
END ENTITY;

ARCHITECTURE estrutura OF muxNbits IS
BEGIN
	S <= bar(C);
END ARCHITECTURE;
