library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MULTIPLEXADOR_DOIS is
	port(ENTRADA_1, ENTRADA_2 : in STD_LOGIC_VECTOR(31 downto 0);
			SINAL : in STD_LOGIC;
			SAIDA : out STD_LOGIC_VECTOR (31 downto 0));
end;

architecture behave of MULTIPLEXADOR_DOIS is
begin 
	process(ENTRADA_1, ENTRADA_2, SINAL)
	begin
		if (SINAL = '0') then SAIDA <= ENTRADA_1;
		elsif (SINAL = '1') then SAIDA <= ENTRADA_2;
		end if;
	end process;
	
end behave;
	