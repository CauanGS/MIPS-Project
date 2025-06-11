library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ADDER is
    generic(n : integer := 32);
    port 
    ( 
        operando1 : in STD_LOGIC_VECTOR(n-1 downto 0);
        operando2 : in STD_LOGIC_VECTOR(n-1 downto 0);
        resultado : out STD_LOGIC_VECTOR(n-1 downto 0)
    );
end ADDER;

architecture Behavioral of ADDER is 
begin
    resultado <= std_logic_vector(
                   unsigned(operando1) + unsigned(operando2)
                 );
end Behavioral;
