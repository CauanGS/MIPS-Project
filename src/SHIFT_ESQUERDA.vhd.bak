library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SHIFT_ESQUERDA is
    port(
        ENTRADA : in  STD_LOGIC_VECTOR(25 downto 0);      -- 26-bit input
        SAIDA : out STD_LOGIC_VECTOR(27 downto 0)       -- 28-bit output
    );
end;

architecture behave of SHIFT_ESQUERDA is
begin
    SAIDA <= ENTRADA & "00";  -- shift lógico à esquerda de 2 bits
end behave;
