library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SOMADOR is 
	port( ENTRADA_A : in STD_LOGIC_VECTOR(31 downto 0);
			ENTRADA_B : in STD_LOGIC_VECTOR(31 downto 0);
			RESULTADO : out STD_LOGIC_VECTOR(31 downto 0));
end;

architecture behave of SOMADOR is
	signal A_INTEIRO, B_INTEIRO, R_INTEIRO : SIGNED(31 downto 0);  -- Sinais internos para realizar a soma com sinal
	begin
		process (ENTRADA_A, ENTRADA_B) -- processo combinacional sensível a entrada
		begin 
		-- Convertendo do tipo STD_LOGIC_VECTOR para o tipo 'signed' para a soma
			A_INTEIRO <= SIGNED(ENTRADA_A);
			B_INTEIRO <= SIGNED(ENTRADA_B);
			R_INTEIRO <= A_INTEIRO + B_INTEIRO;
		end process;
	RESULTADO <= STD_LOGIC_VECTOR(R_INTEIRO); -- converte o resultado para um vetor
	
end behave;