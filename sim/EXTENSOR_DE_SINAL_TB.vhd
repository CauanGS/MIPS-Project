LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY extensor_de_sinal_tb IS
END ENTITY;

ARCHITECTURE behavioral OF extensor_de_sinal_tb IS

    -- 1. Declaração do Componente 
    COMPONENT EXTENSOR_DE_SINAL IS
        PORT (
            entrada : IN  STD_LOGIC_VECTOR(15 DOWNTO 0);
            saida   : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
        );
    END COMPONENT;

    -- Sinais internos do testbench 
    SIGNAL tb_entrada : STD_LOGIC_VECTOR(15 DOWNTO 0) := (OTHERS => '0');
    SIGNAL tb_saida   : STD_LOGIC_VECTOR(31 DOWNTO 0);

BEGIN

    -- 3. Instanciação do UUT
    uut: EXTENSOR_DE_SINAL PORT MAP (
        entrada => tb_entrada,
        saida   => tb_saida
    );

    -- 4. Processo de Estímulo 
    stimulus_process: PROCESS
    BEGIN
        REPORT "Iniciando teste do EXTENSOR_DE_SINAL...";

        -- Caso de Teste 1: Número positivo (0x0001)
        tb_entrada <= X"0001";
        WAIT FOR 10 ns;

        -- Caso de Teste 2: Maior número positivo (0x7FFF)
        tb_entrada <= X"7FFF";
        WAIT FOR 10 ns;

        -- Caso de Teste 3: Número negativo (-1 = 0xFFFF)
        tb_entrada <= X"FFFF";
        WAIT FOR 10 ns;

        -- Caso de Teste 4: Maior número negativo (-32768 = 0x8000)
        tb_entrada <= X"8000";
        WAIT FOR 10 ns;

        REPORT "Teste concluído.";
        WAIT;
    END PROCESS;

END ARCHITECTURE;