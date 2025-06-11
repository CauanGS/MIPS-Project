library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity bin32_to_7seg is
    Port (
        resultado_final : in std_logic_vector(31 downto 0);
        HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : out std_logic_vector(6 downto 0)
    );
end bin32_to_7seg;

architecture Behavioral of bin32_to_7seg is

    signal valor : unsigned(31 downto 0);
    type digit_array is array(7 downto 0) of integer range 0 to 9;
    signal digitos : digit_array;

    -- Converte um número decimal de 0 a 9 para o padrão 7 segmentos
    function dec_to_7seg(d : integer) return std_logic_vector is
        variable seg : std_logic_vector(6 downto 0);
    begin
        case d is
            when 0 => seg := "1000000";
            when 1 => seg := "1111001";
            when 2 => seg := "0100100";
            when 3 => seg := "0110000";
            when 4 => seg := "0011001";
            when 5 => seg := "0010010";
            when 6 => seg := "0000010";
            when 7 => seg := "1111000";
            when 8 => seg := "0000000";
            when 9 => seg := "0010000";
            when others => seg := "0000000";
        end case;
        return seg;
    end function;

begin

    valor <= unsigned(resultado_final);

    process(valor)
        variable temp : unsigned(31 downto 0);
    begin
        temp := valor;
        for i in 0 to 7 loop
            digitos(i) <= to_integer(temp mod 10);
            temp := temp / 10;
        end loop;
    end process;

    -- HEX0 mostra unidade, HEX7 mostra milhões
    HEX0 <= dec_to_7seg(digitos(0));
    HEX1 <= dec_to_7seg(digitos(1));
    HEX2 <= dec_to_7seg(digitos(2));
    HEX3 <= dec_to_7seg(digitos(3));
    HEX4 <= dec_to_7seg(digitos(4));
    HEX5 <= dec_to_7seg(digitos(5));
    HEX6 <= dec_to_7seg(digitos(6));
    HEX7 <= dec_to_7seg(digitos(7));

end Behavioral;
