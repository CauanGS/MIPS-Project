library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity RESETE_CONTADOR_PROGRAMA is 
    port(
        CLK      : in  STD_LOGIC;
        RESET      : in  STD_LOGIC; -- Adicionada entrada de reset
        ENDERECO_ENTRADA  : in  STD_LOGIC_VECTOR (31 downto 0);
        ENDERECO_SAIDA : out STD_LOGIC_VECTOR (31 downto 0)
    );
end entity RESETE_CONTADOR_PROGRAMA;

architecture behave of RESETE_CONTADOR_PROGRAMA is
begin

    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then -- Verifica se o reset está ativo (nível alto)
                ENDERECO_SAIDA <= (others => '0'); -- Zera o PC
            else
                -- Lógica original mantida, mas agora só executa se não houver reset
                -- ATENÇÃO: A lógica original de verificar se adrs_in é zero pode não ser 
                -- o comportamento padrão de um PC MIPS, que geralmente apenas carrega adrs_in.
                -- Considere revisar esta parte se o comportamento não for o esperado.
                if ENDERECO_ENTRADA = X"00000000" then  
                    ENDERECO_SAIDA <= (others => '0');   
                else
                    ENDERECO_SAIDA <= ENDERECO_ENTRADA;          
                end if;
            end if;
        end if;
    end process;

end architecture behave;

