library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity MEMORIA_DE_INSTRUCAO is
    port(
        ENTRADA    : in STD_LOGIC_VECTOR(31 downto 0);  -- Endereço de 32 bits
        INSTRUCAO : out STD_LOGIC_VECTOR(31 downto 0)  -- Instrução de 32 bits
    );
end MEMORIA_DE_INSTRUCAO;

architecture behave of MEMORIA_DE_INSTRUCAO is
    type TIPORAM is array(63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
    signal MEMORIA : TIPORAM := (
        -- Endereço de Palavra (índice do array)
        -- Inicialização
        0 => x"20100000",  -- 0x00: addi $s0, $zero, 0     			($s0 = soma = 0)
        1 => x"20110001",  -- 0x04: addi $s1, $zero, 1     			($s1 = i = 1)
        2 => x"20080004",  -- 0x08: addi $t0, $zero, 4   			(limite = 4)

        -- Início do Loop
        3 => x"0228482A",  -- 0x0C: loop: slt  $t1, $s1, $t0 		($t1 = 1 se i($s1) < 4, senão $t1 = 0)
        4 => x"11200003",  -- 0x10: beq  $t1, $zero, end_loop		(+3 instruções = 0x20)
        
        -- Corpo do Loop
        5 => x"02118020",  -- 0x14: add  $s0, $s0, $s1 				(soma = soma + i)
        6 => x"22310001",  -- 0x18: addi $s1, $s1, 1					(i = i + 1)
        7 => x"08000003",  -- 0x1C: j    loop 							(salta para o endereço 0x0C)

        -- Fim do Loop e Teste de Memória
        8 => x"AC100064",  -- 0x20: end_loop: sw $s0, 100($zero)	(Salva o resultado (6) no endereço de memória 100
        9 => x"8C120064",  -- 0x24: lw   $s2, 100($zero)				(Carrega o valor armazenado no endereço de memória 100 no registrador $s2)

        -- Fim do Programa
        10 => x"0800000A", -- 0x28: done: j done (salta para ele mesmo)

        -- Preenche o resto da memória com NOPs (instrução nula)
        others => x"00000000"
    );
begin
	INSTRUCAO <= MEMORIA(to_integer(unsigned(ENTRADA(7 downto 2)))); -- Instrução recebe a instrução armazenada no endereço = ao valor da ENTRADA
end behave;