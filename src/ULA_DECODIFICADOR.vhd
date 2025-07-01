library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ULA_DECODIFICADOR is
	port(OPERACAO_ULA : in STD_LOGIC_VECTOR(1 downto 0);
			CODIGO_FUNCAO : in STD_LOGIC_VECTOR(5 downto 0);
			CONTROLE_ULA : out STD_LOGIC_VECTOR(2 downto 0));
end;

architecture behave of ULA_DECODIFICADOR is 
begin 
	process(all)
	begin 
		case OPERACAO_ULA is
		when "00" => CONTROLE_ULA <= "010"; -- add (for lw/sw/addi)
		when "01" => CONTROLE_ULA <= "110"; -- sub (for beq)
		when others => case CODIGO_FUNCAO is -- R-type instructions
			when "100000" => CONTROLE_ULA <= "010"; -- add
			when "100010" => CONTROLE_ULA <= "110";-- sub
			when "100100" => CONTROLE_ULA <= "000"; -- and
			when "100101" => CONTROLE_ULA <= "001"; -- or
			when "101010" => CONTROLE_ULA <= "111"; -- slt
			when others => CONTROLE_ULA <= "---"; -- ??
			end case;
		end case;
	end process;
end behave;