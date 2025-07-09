library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity MEMORIA_DE_INSTRUCAO_BYTE is
    port(
        ENTRADA   : in  STD_LOGIC_VECTOR(31 downto 0); -- Endereço de byte
        INSTRUCAO : out STD_LOGIC_VECTOR(31 downto 0)  -- Instrução de 32 bits montada
    );
end;

architecture behave of MEMORIA_DE_INSTRUCAO_BYTE is
   -- Memória agora de 256 Bytes 
   type TIPORAM_BYTE is array(255 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
    
   -- Inicializando a memória byte a byte com a lógica little endian
   signal MEMORIA : TIPORAM_BYTE := (
        
		  
	-- Inicialização:
	 
																		-- 0x00: addi $s0, $zero, 0   (0x20100000)
   0 => x"00",  -- LSB
   1 => x"00",
   2 => x"10",
   3 => x"20",  -- MSB  
	
	4 => x"01", 5 => x"00", 6 => x"11", 7 => x"20",  	-- 0x04: addi $s1, $zero, 1   (0x20110001)
	8 => x"03",  9 => x"00", 10=> x"08", 11=> x"20",  	-- 0x08: addi $t0, $zero, 3   (0x20080003)
   
	-- Início do loop
	12=> x"2A",  13=> x"48", 14=> x"28", 15=> x"02", 	-- 0x0C: loop: slt $t1, $s1, $t0  (0x0228482A)
	16=> x"03", 17=> x"00", 18=> x"20", 19=> x"11", 	-- 0x10: beq $t1, $zero, end_loop (0x11200003)

	-- Corpo do loop
   20=> x"20", 21=> x"80", 22=> x"11", 23=> x"02", 	-- 0x14: add $s0, $s0, $s1 (0x02118020)
	24=> x"01", 25=> x"00", 26=> x"31", 27=> x"22", 	-- 0x18: addi $s1, $s1, 1  (0x22310001)
	28=> x"03", 29=> x"00", 30=> x"00", 31=> x"08",   	-- 0x1C: j loop            (0x08000003)

	-- Fim do loop e teste de memória
   32=> x"64", 33=> x"00", 34=> x"10", 35=> x"AC",   	-- 0x20: end_loop: sw $s0, 100($zero)  (0xAC100064)
	36=> x"64", 37=> x"00", 38=> x"12", 39=> x"8C",   	-- 0x24: lw $s2, 100($zero) 				(0x8C120064)

	-- Fim do programa
   40=> x"0A", 41=> x"00", 42=> x"00", 43=> x"08", 	-- 0x28: fim: j fim (0x0800000A)
        
   others => x"00" -- preenche o resto da memória com zeros
    );

    -- Sinal para armazenar o endereço de byte como um inteiro
    signal endereco_base : integer range 0 to 255;
    
begin

    endereco_base <= to_integer(unsigned(ENTRADA(7 downto 0)));

    -- Monta a instrução de 32 bits a partir de 4 leituras de byte
    INSTRUCAO <= MEMORIA(endereco_base + 3) & 
                 MEMORIA(endereco_base + 2) & 
                 MEMORIA(endereco_base + 1) & 
                 MEMORIA(endereco_base);

end behave;