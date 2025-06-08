library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity MULTIPLEX is
  GENERIC(n : integer := 32);
  port( 
        input_1    : in std_logic_vector(n - 1 downto 0);
        input_2    : in std_logic_vector(n - 1 downto 0);
        sinal_controle : in std_logic; 
		  
        output     : out std_logic_vector(n - 1 downto 0) 
	   );
end MULTIPLEX;

architecture Behavioral of MULTIPLEX is
begin
with sinal_controle select
  output <= input_1 when '0', input_2 when others;
end Behavioral;