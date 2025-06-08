library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity REG_FILE is
    generic (
        N : integer := 5;  -- Número de bits do endereço (ex: 5 bits -> 32 registradores)
        M : integer := 32  -- Tamanho do dado (ex: 32 bits por registrador)
    );
    port (
        clk         : in std_logic;
        we          : in std_logic;
        read_reg1   : in std_logic_vector(N-1 downto 0);
        read_reg2   : in std_logic_vector(N-1 downto 0);
        write_reg   : in std_logic_vector(N-1 downto 0);
        write_data  : in std_logic_vector(M-1 downto 0);
        data_out1   : out std_logic_vector(M-1 downto 0);
        data_out2   : out std_logic_vector(M-1 downto 0)
    );
end REG_FILE;

architecture behavior of REG_FILE is
    type reg_array is array((2**N)-1 downto 0) of std_logic_vector(M-1 downto 0);
    signal registers : reg_array;
begin

    -- Escrita sincrona
    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                registers(to_integer(unsigned(write_reg))) <= write_data;
            end if;
        end if;
    end process;

    -- Leitura assíncrona (pode ser síncrona se quiser)
    data_out1 <= registers(to_integer(unsigned(read_reg1)));
    data_out2 <= registers(to_integer(unsigned(read_reg2)));

end behavior;