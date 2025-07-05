library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ULA is
    Port(
        ENTRADA_A     : in STD_LOGIC_VECTOR (31 downto 0);
        ENTRADA_B     : in STD_LOGIC_VECTOR (31 downto 0);
        OPERACAO    : in STD_LOGIC_VECTOR(2 downto 0);
        RESULTADO : out STD_LOGIC_VECTOR(31 downto 0);
        ZERO  : out STD_LOGIC
    );
end ULA;

architecture behave of ULA is

	 -- Define os sinais INTEIRO_A e INTEIRO_B para serem usados como intermediários
	 -- Sinais internos para realizar a aritmética com sinal
    signal INTEIRO_A, INTEIRO_B : signed(31 downto 0); 
    signal RESULTADO_TEMPORARIO  : signed(31 downto 0); 
	 -- Estes sinais armazenarão a versão 'signed' das entradas.
begin

    -- Convertendo do tipo STD_LOGIC_VECTOR para o tipo 'signed' para fazer as operações
    INTEIRO_A <= signed(ENTRADA_A);
    INTEIRO_B <= signed(ENTRADA_B);

    process(INTEIRO_A, INTEIRO_B, OPERACAO)
    variable TEMPORARIO : signed(31 downto 0);
begin
    case OPERACAO is
        when "000" => TEMPORARIO := INTEIRO_A and INTEIRO_B; -- Operação AND bit a bit
        when "001" => TEMPORARIO := INTEIRO_A or INTEIRO_B; -- Operação OR bit a bit
        when "010" => TEMPORARIO := INTEIRO_A + INTEIRO_B; -- Operação SOMA (ADD) com sinal
        when "100" => TEMPORARIO := INTEIRO_A and (not INTEIRO_B); -- Operação A AND (NOT B)
        when "101" => TEMPORARIO := INTEIRO_A or (not INTEIRO_B); -- Operação A OR (NOT B)
        when "110" => TEMPORARIO := INTEIRO_A - INTEIRO_B; -- Operação SUBTRAÇÃO (SUB) com sinal
        when "111" => -- Operação SET ON LESS THAN (SLT) com sinal
            if INTEIRO_A < INTEIRO_B then
                TEMPORARIO := (others => '0'); -- zera o vetor
                TEMPORARIO(0) := '1'; -- seta o bit menos significativo pra 1
            else
                TEMPORARIO := (others => '0'); 
            end if;
        when others =>
            TEMPORARIO := (others => '0'); -- Resultado padrão é 0 para operações não definidas
    end case;
    RESULTADO_TEMPORARIO <= TEMPORARIO; -- resultado temporário recebe resultado para que possa sair do processo
end process;
    -- Converte o resultado interno (signed) de volta para STD_LOGIC_VECTOR
    RESULTADO <= std_logic_vector(RESULTADO_TEMPORARIO);

    -- sinalizador ZERO recebe '1' se o resultado for zero, '0' caso contrário
    ZERO <= '1' when RESULTADO_TEMPORARIO = 0 else '0';
end behave;
