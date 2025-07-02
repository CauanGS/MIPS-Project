library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SHIFT_ESQUERDA32 is
    port(
        ENTRADA : in  STD_LOGIC_VECTOR(29 downto 0);      -- 29-bit input
        SAIDA : out STD_LOGIC_VECTOR(31 downto 0)       -- 31-bit output
    );
end;

architecture behave of SHIFT_ESQUERDA32 is
begin
    SAIDA <= ENTRADA & "00";  -- shift lógico à esquerda de 2 bits
end behave;
