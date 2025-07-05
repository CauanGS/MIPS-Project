library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONCATENAR_ENTRADAS is
    Port (
		  -- ENTRADA_1: 28 bits inferiores do endereço de salto
        ENTRADA_1 : in  STD_LOGIC_VECTOR(27 downto 0);
		  -- ENTRADA_2: 4 bits superiores do endereço de salto
        ENTRADA_2 : in  STD_LOGIC_VECTOR(3 downto 0);   
		  -- SAIDA: endereço de salto final de 32 bits
        SAIDA    : out STD_LOGIC_VECTOR(31 downto 0)   
    );
end CONCATENAR_ENTRADAS;

architecture behave of CONCATENAR_ENTRADAS is
begin

	SAIDA <= ENTRADA_2 & ENTRADA_1; 

end behave;
