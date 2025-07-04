library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SOMADOR_MAIS_QUATRO is 
    port( 
        ENTRADA : in  STD_LOGIC_VECTOR(31 downto 0);
        SAIDA   : out STD_LOGIC_VECTOR(31 downto 0)
    );
end;

architecture behave of SOMADOR_MAIS_QUATRO is
begin
    SAIDA <= std_logic_vector(signed(ENTRADA) + 4);  -- saida recebe o endereço de entrada + 4 
end behave;