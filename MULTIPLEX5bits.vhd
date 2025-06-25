library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUXTIPLEX5bits is
	port(e1, e2 : in STD_LOGIC_VECTOR(4 downto 0);
			sinal : in STD_LOGIC;
			s : out STD_LOGIC_VECTOR (4 downto 0));
end MUXTIPLEX5bits;

architecture behavior of MUXTIPLEX5bits is
begin 
	process(e1, e2, sinal)
	begin
		if (sinal = '0') then s <= e1;
		elsif (sinal = '1') then s <= e2;
		end if;
	end process;
	
end behavior;
	