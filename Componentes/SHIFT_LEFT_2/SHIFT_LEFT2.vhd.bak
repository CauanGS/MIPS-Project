library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SHIFT_LEFT_2 is
  port( 
		  -- Entrada
        input  : in std_logic_vector(31 downto 0);

        -- Saída
        output : out std_logic_vector(31 downto 0) 
	   );
end SHIFT_LEFT_2;

architecture Behavioral of SHIFT_LEFT_2 is
begin
  output <= std_logic_vector(unsigned(input) sll 2);
end Behavioral;