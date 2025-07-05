library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity DISPLAY_SETE_SEGMENTOS is
    port(
        ENTRADA_EM_HEXA  : in  STD_LOGIC_VECTOR(3 downto 0);
        SEG_SAIDA : out STD_LOGIC_VECTOR(6 downto 0) -- cada bit controla seu respectivo segmento: g(6) f(5) e(4) d(3) c(2) b(1) a(0)
    );
end entity;

architecture behave of DISPLAY_SETE_SEGMENTOS is
begin
    process(ENTRADA_EM_HEXA) --process para poder usar o case
    begin
        case ENTRADA_EM_HEXA is
            -- Padrões ativos em baixo (0=segmento acesso, 1=segmento apagado para gfedcba)
            when "0000" => SEG_SAIDA <= "1000000"; -- 0
            when "0001" => SEG_SAIDA <= "1111001"; -- 1
            when "0010" => SEG_SAIDA <= "0100100"; -- 2
            when "0011" => SEG_SAIDA <= "0110000"; -- 3
            when "0100" => SEG_SAIDA <= "0011001"; -- 4
            when "0101" => SEG_SAIDA <= "0010010"; -- 5
            when "0110" => SEG_SAIDA <= "0000010"; -- 6
            when "0111" => SEG_SAIDA <= "1111000"; -- 7
            when "1000" => SEG_SAIDA <= "0000000"; -- 8
            when "1001" => SEG_SAIDA <= "0010000"; -- 9
            when "1010" => SEG_SAIDA <= "0001000"; -- A
            when "1011" => SEG_SAIDA <= "0000011"; -- b
            when "1100" => SEG_SAIDA <= "1000110"; -- C
            when "1101" => SEG_SAIDA <= "0100001"; -- d
            when "1110" => SEG_SAIDA <= "0000110"; -- E
            when "1111" => SEG_SAIDA <= "0001110"; -- F
            when others => SEG_SAIDA <= "1111111"; -- Desligado
        end case;
    end process;
end architecture;