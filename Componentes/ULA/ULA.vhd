library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ULA is
    Port (
        SrcA      : in  STD_LOGIC_VECTOR(31 downto 0);  -- Entrada A
        SrcB      : in  STD_LOGIC_VECTOR(31 downto 0);  -- Entrada B
        ALUControl: in  STD_LOGIC_VECTOR(2 downto 0);    -- Controle da ALU (F = F2F1F0)
        ALUResult : out STD_LOGIC_VECTOR(31 downto 0);   -- Resultado da ALU
        Zero      : out STD_LOGIC                        -- Sinal de zero (0 se ALUResult = 0, 1 caso contrário)
    );
end ULA;

architecture Behavioral of ULA is
    signal BB    : STD_LOGIC_VECTOR(31 downto 0);
    signal S     : STD_LOGIC_VECTOR(31 downto 0);
    signal tempY : STD_LOGIC_VECTOR(31 downto 0);
begin
    -- BB recebe NOT SrcB se ALUControl(2) = '1', senão recebe SrcB
    BB <= not SrcB when ALUControl(2) = '1' else SrcB;

    -- Soma: SrcA + BB + ALUControl(2) como carry-in (bit menos significativo)
    S <= SrcA + BB + ("0000000000000000000000000000000" & ALUControl(2));

    process (SrcA, BB, S, ALUControl)
    begin
        case ALUControl(1 downto 0) is
            when "00" =>
                tempY <= SrcA and BB;
            when "01" =>
                tempY <= SrcA or BB;
            when "10" =>
                tempY <= S;
				when "11" =>
                tempY <= (31 downto 1 => '0') & S(31);
        end case;
    end process;

    -- Atribuição da saída ALUResult
    ALUResult <= tempY;

    -- Zero = '1' se ALUResult for zero, caso contrário '0'
    process(tempY)
		begin
			if tempY = X"00000000" then
				Zero <= '1';
			else
				Zero <= '0';
			end if;
	end process;
end Behavioral;