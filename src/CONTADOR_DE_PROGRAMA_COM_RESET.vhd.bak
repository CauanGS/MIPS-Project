library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CONTADOR_DE_PROGRAMA_COM_RESET is 
    port(
        clk      : in  STD_LOGIC;
        adrs_in  : in  STD_LOGIC_VECTOR (31 downto 0);
		  rst      : in  STD_LOGIC; -- Adicionada entrada de reset
        adrs_out : out STD_LOGIC_VECTOR (31 downto 0)
    );
end entity CONTADOR_DE_PROGRAMA_COM_RESET;

architecture behavior of CONTADOR_DE_PROGRAMA_COM_RESET is
begin

process(clk)
begin
    if rising_edge(clk) then
        if rst = '1' then
            adrs_out <= (others => '0'); -- Reset
        else
            adrs_out <= adrs_in;        -- Mantém valor atual
            -- Ou simplesmente não faça nada (já mantém)
        end if;
    end if;
end process;



end architecture behavior;

