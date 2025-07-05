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
		when "00" => CONTROLE_ULA <= "010"; 		-- add para as instruções lw, sw, addi
		when "01" => CONTROLE_ULA <= "110"; 		-- sub para a instrução beq 
		when others => case CODIGO_FUNCAO is 			-- instruções do tipo-R
			when "100000" => CONTROLE_ULA <= "010"; 	-- instrução add
			when "100010" => CONTROLE_ULA <= "110";	-- instrução sub
			when "100100" => CONTROLE_ULA <= "000"; 	-- instrução and
			when "100101" => CONTROLE_ULA <= "001"; 	-- instrução or
			when "101010" => CONTROLE_ULA <= "111"; 	-- instrução slt
			when others => CONTROLE_ULA <= "---"; 		-- operação não suportada/inválida
			end case;
		end case;
	end process;
end behave;