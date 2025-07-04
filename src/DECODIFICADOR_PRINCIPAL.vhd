library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DECODIFICADOR_PRINCIPAL is
	port( op : in STD_LOGIC_VECTOR(5 downto 0);
			memtoreg, memwrite : out STD_LOGIC;
			branch, alusrc : out STD_LOGIC;
			regdst, regwrite : out STD_LOGIC;
			jump :  out STD_LOGIC;
			aluop : out STD_LOGIC_VECTOR(1 downto 0)
		 );
end;

architecture behave of DECODIFICADOR_PRINCIPAL is
	signal CONTROLES : STD_LOGIC_VECTOR(8 downto 0);
begin
	process(all) -- process para usar o case, lógica combinacional
	begin
		case op is  -- quando op é igual a <condição> controles recebe <tipo da instrução>
			when "000000" => CONTROLES <= "110000010"; -- R-type
			when "100011" => CONTROLES <= "101001000"; -- lw
			when "101011" => CONTROLES <= "001010000"; -- sw
			when "000100" => CONTROLES <= "000100001"; -- beq
			when "001000" => CONTROLES <= "101000000"; -- addi
			when "000010" => CONTROLES <= "000000100"; -- jump
			when others => CONTROLES <= "---------";   -- operação ilegal / não implementada
		end case;
	end process;
	
	 regwrite   <= CONTROLES(8);  -- regwrite recebe o bit mais significativo do vetor CONTROLES
    regdst     <= CONTROLES(7);  -- regdst recebe o segundo bit mais significativo do vetor CONTROLES
    alusrc     <= CONTROLES(6);  -- alusrc recebe o Terceiro bit mais significativo do vetor CONTROLES
    branch     <= CONTROLES(5);  -- branch recebe o Quarto bit mais significativo do vetor CONTROLES
    memwrite   <= CONTROLES(4);  -- memwrite recebe o Quinto bit mais significativo do vetor CONTROLES
    memtoreg   <= CONTROLES(3);  -- memtoreg recebe o sexto bit mais significativo do vetor CONTROLES
    jump       <= CONTROLES(2);  -- jump recebe o sétimo bit mais significativo do vetor CONTROLES
    aluop      <= CONTROLES(1 downto 0);  -- aluop recebe os dois bits menos significativos do vetor CONTROLES
	 
end behave;