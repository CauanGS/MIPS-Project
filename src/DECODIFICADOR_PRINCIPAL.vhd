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
	process(all)
	begin
		case op is 
			when "000000" => CONTROLES <= "110000010"; -- R-type
			when "100011" => CONTROLES <= "101001000"; -- lw
			when "101011" => CONTROLES <= "001010000"; -- sw
			when "000100" => CONTROLES <= "000100001"; -- beq
			when "001000" => CONTROLES <= "101000000"; -- addi
			when "000010" => CONTROLES <= "000000100"; -- jump
			when others => CONTROLES <= "---------"; -- illegal op
		end case;
	end process;
	
	 regwrite   <= CONTROLES(8);  -- 1 bit
    regdst     <= CONTROLES(7);  -- 1 bit
    alusrc     <= CONTROLES(6);  -- 1 bit
    branch     <= CONTROLES(5);  -- 1 bit
    memwrite   <= CONTROLES(4);  -- 1 bit
    memtoreg   <= CONTROLES(3);  -- 1 bit
    jump       <= CONTROLES(2);  -- 1 bit
    aluop      <= CONTROLES(1 downto 0);  -- 2 bits
	 
end behave;