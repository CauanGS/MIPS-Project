library IEEE;
use IEEE.std_logic_1164.all;

entity CONTROL_UNIT is
  port( 
		  -- Entradas
        instruction : in std_logic_vector(31 downto 0);
        ZeroCarry   : in std_logic;

        -- Sinais de controle (SAIDAS)
        RegDst      : out std_logic;
        Jump        : out std_logic;
        Branch      : out std_logic;
        MemRead     : out std_logic;
        MemToReg    : out std_logic;
        ALUOp       : out std_logic_vector (3 downto 0);
        MemWrite    : out std_logic;
        ALUSrc      : out std_logic;
        RegWrite    : out std_logic 
       );
end CONTROL_UNIT;

architecture Behavioral of CONTROL_UNIT is
  signal data : std_logic_vector(11 downto 0);  -- To set the control signals
begin
  -- GERANDO SINAIS D CONTROLE D ACORDO COM A ARQUITUTURA MIPS
  -- Tipo-R: Adição
  data <= "100000000001" when (instruction(31 downto 26) = "000000" and
                               instruction(10 downto 0)  = "00000100000") else
  -- Tipo-R: Subtração
  "100000001001" when (instruction(31 downto 26) = "000000" and
                       instruction(10 downto 0)  = "00000100010") else
  -- Tipo-R: AND
  "100000010001" when (instruction(31 downto 26) = "000000" and
                       instruction(10 downto 0)  = "00000100100") else
  -- Tipo-R: OR
  "100000011001" when (instruction(31 downto 26) = "000000" and
                       instruction(10 downto 0)  = "00000100101") else
  -- Tipo-R: NOR
  "100000100001" when (instruction(31 downto 26) = "000000" and
                       instruction(10 downto 0)  = "00000100111") else
  -- Tipo-R: XOR
  "100000110001" when (instruction(31 downto 26) = "000000" and
                       instruction(5 downto 0)   = "100110") else
  -- Tipo-R: SLL (Shift Left Logical) 
  "100000111011" when (instruction(31 downto 26) = "000000" and
                       instruction(5 downto 0)   = "000000") else
  -- Tipo-R: SRL (Shift Right Logical)
  "100001000011" when (instruction(31 downto 26) = "000000" and
                       instruction(5 downto 0)   = "000010") else
  -- Tipo-R: SLT (Set Less Than)
  "100001001001" when (instruction(31 downto 26) = "000000" and
                       instruction(10 downto 0)  = "00000101010") else
  -- Tipo-I: Adição com imediato
  "000000000011" when instruction(31 downto 26) = "001000" else
  -- Tipo-I: LW (Load Word)
  "000110000011" when instruction(31 downto 26) = "100011" else
  -- Tipo-I: SW (Store Word)
  "000000000110" when instruction(31 downto 26) = "101011" else
  -- Tipo-I: ANDI (AND Immediate)
  "000000010011" when instruction(31 downto 26) = "001100" else
  -- Tipo-I: ORI (OR Immediate)
  "000000011011" when instruction(31 downto 26) = "001101" else
  -- Tipo-I: BEQ (Branch on Equal)
  "001000001000" when instruction(31 downto 26) = "000100" else
  -- Tipo-I: BNE (Branch on Not Equal)
  "001000110010" when instruction(31 downto 26) = "000101" else
  -- Tipo-I: SLTI (Set Less Than Immediate)
  "000001001011" when instruction(31 downto 26) = "001010" else
  -- Tipo-J: J (Jump)
  "010000000000" when instruction(31 downto 26) = "000010" else
  -- Caso contrario 
  (others =>'0');

  -- Seta os sinais de controle de acordo com a decodificação
  RegDst   <= data(11);
  Jump     <= data(10);
  -- porta AND incluida considerando LSB do BEG e BNE
  Branch   <= data(9) AND (ZeroCarry XOR instruction(26));
  MemRead  <= data(8);
  MemToReg <= data(7);
  ALUOp    <= data(6 downto 3);
  MemWrite <= data(2);
  ALUSrc   <= data(1);
  RegWrite <= data(0);

end Behavioral;