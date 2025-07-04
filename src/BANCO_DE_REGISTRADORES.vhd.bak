library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BANCO_DE_REGISTRADORES is
    Port ( CLK        : in  STD_LOGIC;              -- Sinal de clock
           RESET      : in  STD_LOGIC;              -- Sinal de reset síncrono
           WE         : in  STD_LOGIC;              -- Controle de escrita
           ENDERECO_LEITURA1      : in  STD_LOGIC_VECTOR(4 downto 0); -- Endereço de leitura 1
           ENDERECO_LEITURA2      : in  STD_LOGIC_VECTOR(4 downto 0); -- Endereço de leitura 2
           ENDERECO_ESCRITA      : in  STD_LOGIC_VECTOR(4 downto 0); -- Endereço de escrita
           DADOS_ESCREVER : in  STD_LOGIC_VECTOR(31 downto 0); -- Dados a serem escritos
           DADO_LIDO1 : out STD_LOGIC_VECTOR(31 downto 0); -- Saída leitura 1
           DADO_LIDO2 : out STD_LOGIC_VECTOR(31 downto 0)  -- Saída leitura 2
         );
end BANCO_DE_REGISTRADORES;

architecture behave of BANCO_DE_REGISTRADORES is

    -- Banco de registradores: 32 registradores de 32 bits
    type BANCO_REGISTRADORES is array(0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
    signal REGISTRADORES : BANCO_REGISTRADORES := (others => (others => '0'));

begin

    -- Processo de escrita e reset síncrono
    process(CLK)
    begin
        if rising_edge(CLK) then
            if RESET = '1' then
                REGISTRADORES <= (others => (others => '0'));
            elsif WE = '1' then
                REGISTRADORES(to_integer(unsigned(ENDERECO_ESCRITA))) <= DADOS_ESCREVER;
            end if;
        end if;
    end process;

    -- Processo de leitura (com registrador zero fixo)
    process(all)
    begin
        if (to_integer(unsigned(ENDERECO_LEITURA1)) = 0) then
            DADO_LIDO1 <= X"00000000";
        else
            DADO_LIDO1 <= REGISTRADORES(to_integer(unsigned(ENDERECO_LEITURA1)));
        end if;

        if (to_integer(unsigned(ENDERECO_LEITURA2)) = 0) then
            DADO_LIDO2 <= X"00000000";
        else
            DADO_LIDO2 <= REGISTRADORES(to_integer(unsigned(ENDERECO_LEITURA2)));
        end if;
    end process;

end behave;
