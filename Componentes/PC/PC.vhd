library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity PC is
	GENERIC (n : integer := 32);
	Port( 
			clk : in std_logic;
			reset : in std_logic;
			prox_end : in std_logic_vector(31 downto 0);
			
			end_atual : out std_logic_vector(31 downto 0)
			);
end PC;

architecture behavioral of PC is
begin
	process (clk)
	begin
		if reset = '0' then
			end_atual <= (others => '0');
		elsif rising_edge(CLK) then
			end_atual <= prox_end;
		end if;
  end process;
end behavioral;