library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SOMADOR_MAIS_QUATRO is 
	port( ENTRADA_A : in STD_LOGIC_VECTOR(31 downto 0);
			SAIDA : out STD_LOGIC_VECTOR(31 downto 0));
end;

architecture behave of SOMADOR_MAIS_QUATRO is
	signal A_INTEIRO, SAIDA_INTEIRO : SIGNED(31 downto 0);
	begin
		process (ENTRADA_A)
		begin 
			
			A_INTEIRO <= SIGNED(ENTRADA_A);
			SAIDA_INTEIRO <= A_INTEIRO + to_signed(4, 32);
		end process;
	SAIDA <= STD_LOGIC_VECTOR(SAIDA_INTEIRO);
	
end behave;
