library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CONTADOR_DE_PROGRAMA_COM_RESET is 
    port(
        CLK      : in  STD_LOGIC;
        ENDERECO_ENTRADA  : in  STD_LOGIC_VECTOR (31 downto 0);
		  RESET      : in  STD_LOGIC; -- Entrada de reset para evitar problemas de valores iniciais inesperados na hora de passar pra placa
        ENDERECO_SAIDA : out STD_LOGIC_VECTOR (31 downto 0)
    );
end entity CONTADOR_DE_PROGRAMA_COM_RESET;

architecture behave of CONTADOR_DE_PROGRAMA_COM_RESET is
begin

process(CLK)
begin
    if rising_edge(CLK) then
        if RESET = '1' then
            ENDERECO_SAIDA <= (others => '0'); -- SE o sinal de reset é 1, zera o endereço do PC
        else
            ENDERECO_SAIDA <= ENDERECO_ENTRADA; -- Endereço de saida é igual ao endereço de entrada
        end if;
    end if;
end process;



end architecture behave;

