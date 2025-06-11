library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity SHIFTLEFT2JUMP is
  port( 
		-- Input
        input  : in std_logic_vector(31 downto 0);

        -- Output
        output : out std_logic_vector(27 downto 0) 
	   );
end SHIFTLEFT2JUMP;

architecture Behavioral of SHIFTLEFT2JUMP is
begin
  output <= input(25 downto 0) & "00";
end Behavioral;