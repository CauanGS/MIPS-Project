library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity EXTENSOR_DE_SINAL is
	port(ENTRADA: in std_logic_vector(15 downto 0);
			SAIDA: out std_logic_vector(31 downto 0));
end;

architecture behave of EXTENSOR_DE_SINAL is
begin
	SAIDA <= X"ffff" & ENTRADA when ENTRADA(15) = '1' else X"0000" & ENTRADA; 
	-- X"a" converte "a" para hexadecimal
end behave;