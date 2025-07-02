library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CONCATENAR_ENTRADAS is
    Port (
        ENTRADA_1 : in  STD_LOGIC_VECTOR(27 downto 0);  -- 28 bits
        ENTRADA_2 : in  STD_LOGIC_VECTOR(3 downto 0);   -- 4 bits (MSBs)
        SAIDA    : out STD_LOGIC_VECTOR(31 downto 0)   -- 32 bits
    );
end CONCATENAR_ENTRADAS;

architecture behave of CONCATENAR_ENTRADAS is
begin
    process(ENTRADA_1, ENTRADA_2)
    begin
        -- Concatena os 4 bits de entrada2 como MSBs com os 28 bits de entrada1
        SAIDA <= ENTRADA_2 & ENTRADA_1;
    end process;
end behave;
