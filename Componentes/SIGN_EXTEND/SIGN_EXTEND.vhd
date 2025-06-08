library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SIGN_EXTEND is
  port( 
		-- Entrada
        input  : in std_logic_vector(15 downto 0); -- 16-bit

        -- Saída
        output : out std_logic_vector(31 downto 0) -- 32-bit sinal-extendido
	   );
end SIGN_EXTEND;

architecture Behavioral of SIGN_EXTEND is
begin
 -- Extensão do sinal baseada no digito mais significativo
 output <= "0000000000000000" & input when (input(15) = '0') else
           "1111111111111111" & input;
end Behavioral;