library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity DISPLAY_SETE_SEGMENTOS is
    Port (
        RESULTADO : in std_logic_vector(31 downto 0);
        HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : out std_logic_vector(6 downto 0)
    );
end DISPLAY_SETE_SEGMENTOS;

architecture behave of DISPLAY_SETE_SEGMENTOS is

    signal VALOR : unsigned(31 downto 0);
    type VETOR_DIGITOS is array(7 downto 0) of integer range 0 to 9;
    signal DIGITOS : VETOR_DIGITOS;

    -- Converte um número decimal de 0 a 9 para o padrão 7 segmentos
    function DECODIFICAR(D : integer) return std_logic_vector is
        variable SEGMENTO : std_logic_vector(6 downto 0);
    begin
        case D is
            when 0 => SEGMENTO := "1000000";
            when 1 => SEGMENTO := "1111001";
            when 2 => SEGMENTO := "0100100";
            when 3 => SEGMENTO := "0110000";
            when 4 => SEGMENTO := "0011001";
            when 5 => SEGMENTO := "0010010";
            when 6 => SEGMENTO := "0000010";
            when 7 => SEGMENTO := "1111000";
            when 8 => SEGMENTO := "0000000";
            when 9 => SEGMENTO := "0010000";
            when others => SEGMENTO := "0000000";
        end case;
        return SEGMENTO;
    end function;

begin

    VALOR <= unsigned(RESULTADO);

    process(VALOR)
        variable TEMPORARIO : unsigned(31 downto 0);
    begin
        TEMPORARIO := VALOR;
        for i in 0 to 7 loop
            DIGITOS(i) <= to_integer(TEMPORARIO mod 10);
            TEMPORARIO := TEMPORARIO / 10;
        end loop;
    end process;

    -- HEX0 mostra unidade, HEX7 mostra milhões
    HEX0 <= DECODIFICAR(DIGITOS(0));
    HEX1 <= DECODIFICAR(DIGITOS(1));
    HEX2 <= DECODIFICAR(DIGITOS(2));
    HEX3 <= DECODIFICAR(DIGITOS(3));
    HEX4 <= DECODIFICAR(DIGITOS(4));
    HEX5 <= DECODIFICAR(DIGITOS(5));
    HEX6 <= DECODIFICAR(DIGITOS(6));
    HEX7 <= DECODIFICAR(DIGITOS(7));

end behave;
