library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;

entity PC4 is
	port ( input: in STD_LOGIC_VECTOR (31 downto 0);
			 output: out STD_LOGIC_VECTOR (31 downto 0));
end PC4;

architecture behavior of PC4 is 	
begin	
	output <= input + x"00000004";
end behavior;