library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity SHIFT_ESQUERDA32 is
    port(
        ENTRADA : in  STD_LOGIC_VECTOR(31 downto 0);
        SAIDA   : out STD_LOGIC_VECTOR(31 downto 0)
    );
end entity;

architecture behave of SHIFT_ESQUERDA32 is
begin
    SAIDA <= ENTRADA(29 downto 0) & "00";
end behave;