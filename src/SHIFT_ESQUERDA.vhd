library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SHIFT_ESQUERDA is
    port(
        ENTRADA : in  STD_LOGIC_VECTOR(25 downto 0);      
        SAIDA : out STD_LOGIC_VECTOR(27 downto 0)      -- 28 bits inferiores do endereço de salto
    );
end;

architecture behave of SHIFT_ESQUERDA is
begin
    SAIDA <= ENTRADA & "00";  -- adicona dois bits ao final "Deslocando" dois bits para esquerda
end behave;
