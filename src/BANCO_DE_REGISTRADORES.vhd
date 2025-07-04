library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity BANCO_DE_REGISTRADORES is
    Port ( CLK        : in  STD_LOGIC;              
           RESET      : in  STD_LOGIC; -- Sinal de reset síncrono
           WE         : in  STD_LOGIC; -- Sinal de controle de escrita
           ENDERECO_LEITURA1      : in  STD_LOGIC_VECTOR(4 downto 0); -- A1
           ENDERECO_LEITURA2      : in  STD_LOGIC_VECTOR(4 downto 0); -- A2
           ENDERECO_ESCRITA      : in  STD_LOGIC_VECTOR(4 downto 0);  -- A3
           DADOS_ESCREVER : in  STD_LOGIC_VECTOR(31 downto 0); 		 -- WD
           DADO_LIDO1 : out STD_LOGIC_VECTOR(31 downto 0); -- RD1
           DADO_LIDO2 : out STD_LOGIC_VECTOR(31 downto 0)  -- RD2
         );
end BANCO_DE_REGISTRADORES;

architecture behave of BANCO_DE_REGISTRADORES is
    type BANCO_REGISTRADORES is array(0 to 31) of STD_LOGIC_VECTOR(31 downto 0);
    signal REGISTRADORES : BANCO_REGISTRADORES := (others => (others => '0'));  -- cria o tipo BANCO_DE_REGISTRADORES para simular um banco de registradores 32 registradores de 32 bits
		-- inicialmente todos os valores em todos os registradores são 0
begin

    -- Process: aqui dentro usa lógica sequencial para a escrita -- a escrita é assíncrona 
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
	 
	-- Lógica de Leitura assíncrona
	-- Porta 1
	DADO_LIDO1 <= x"00000000" when ENDERECO_LEITURA1 = "00000" else 
              REGISTRADORES(to_integer(unsigned(ENDERECO_LEITURA1))); --leitura do registrado $zero é sempre 0

	-- Porta 2
	DADO_LIDO2 <= x"00000000" when ENDERECO_LEITURA2 = "00000" else
              REGISTRADORES(to_integer(unsigned(ENDERECO_LEITURA2))); -- não é possível escrever outro valor no registrador $zero
end behave;
