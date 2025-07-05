library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity MEMORIA_DE_DADOS is
    port(
        CLK   : in STD_LOGIC;
        WE    : in STD_LOGIC;
        A     : in STD_LOGIC_VECTOR(31 downto 0);
        WD    : in STD_LOGIC_VECTOR(31 downto 0);
        RD    : out STD_LOGIC_VECTOR(31 downto 0);
		  RESET : in STD_LOGIC
    );
end MEMORIA_DE_DADOS;

architecture behave of MEMORIA_DE_DADOS is
    type TIPORAM is array(127 downto 0) of STD_LOGIC_VECTOR(31 downto 0); -- cria um um vetor com 128 endereços de 32 bits para simular a memória de dados
    signal MEMORIA: TIPORAM := (others => (others => '0')); -- Inicializa tudo com zeros
begin
    process(CLK)
    begin
        if rising_edge(CLK) then -- escrita síncrona 
            if RESET = '1' then 
                MEMORIA <= (others => (others => '0')); -- se reset ativo mais clock reseta a memória 
            elsif WE = '1' then
                MEMORIA(to_integer(unsigned(A(7 downto 2)))) <= WD; -- escreve na memoria no endereço 'A'
            end if;
        end if;
    end process;

    -- Leitura assincrona, combinacional 
    RD <= MEMORIA(to_integer(unsigned(A(7 downto 2))));
end behave;
