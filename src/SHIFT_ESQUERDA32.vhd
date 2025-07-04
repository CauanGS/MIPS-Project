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
    SAIDA <= ENTRADA(29 downto 0) & "00"; -- seleciona apenas os 29 bits mais significativos e então adicona dois bits ao final "Deslocando" dois bits para esquerda
end behave;