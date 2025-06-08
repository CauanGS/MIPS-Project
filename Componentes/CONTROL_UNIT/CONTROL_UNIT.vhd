library IEEE;
use IEEE.std_logic_1164.all;

entity CONTROL_UNIT is
  port(
    -- Inputs
    instruction : in  std_logic_vector(31 downto 0);
    Zero        : in  std_logic;  -- antes ZeroCarry

    -- Outputs (Control Signals)
    RegDst      : out std_logic;          -- [9]
    Jump        : out std_logic;          -- [8]
    Branch      : out std_logic;          -- [7]
    MemToReg    : out std_logic;          -- [6]
    ALUOp       : out std_logic_vector(2 downto 0);  -- [5:3]
    MemWrite    : out std_logic;          -- [2]
    ALUSrc      : out std_logic;          -- [1]
    RegWrite    : out std_logic           -- [0]
  );
end CONTROL_UNIT;

architecture Behavioral of CONTROL_UNIT is
  -- data(9) .. data(0) = RegDst, Jump, Branch, MemToReg,
  --                     ALUOp(2 downto 0), MemWrite, ALUSrc, RegWrite
  signal data : std_logic_vector(9 downto 0);
begin

  data <=
    -- R-type: ADD  (funct=100000) → ALUOp=010
    "1000010001"  when instruction(31 downto 26)="000000" and instruction(5 downto 0)="100000" else
    -- R-type: SUB  (funct=100010) → ALUOp=110
    "1000110001"  when instruction(31 downto 26)="000000" and instruction(5 downto 0)="100010" else
    -- R-type: AND  (funct=100100) → ALUOp=000
    "1000000001"  when instruction(31 downto 26)="000000" and instruction(5 downto 0)="100100" else
    -- R-type: OR   (funct=100101) → ALUOp=001
    "1000010001"  when instruction(31 downto 26)="000000" and instruction(5 downto 0)="100101" else
    -- R-type: SLT  (funct=101010) → ALUOp=111
    "1000111001"  when instruction(31 downto 26)="000000" and instruction(5 downto 0)="101010" else

    -- I-type: ADDI → ALUOp=010, ALUSrc=1
    "0000010011"  when instruction(31 downto 26)="001000" else
    -- I-type: LW   → ALUOp=010, ALUSrc=1, MemToReg=1, RegWrite=1
    "0001010011"  when instruction(31 downto 26)="100011" else
    -- I-type: SW   → ALUOp=010, ALUSrc=1, MemWrite=1
    "0000010110"  when instruction(31 downto 26)="101011" else
    -- I-type: BEQ  → ALUOp=110, Branch=1
    "0010110000"  when instruction(31 downto 26)="000100" else
    -- I-type: BNE  → ALUOp=110, Branch=1
    "0010110000"  when instruction(31 downto 26)="000101" else

    -- J-type: J    → Jump=1 (ALUOp arbitrário "000")
    "0100000000"  when instruction(31 downto 26)="000010" else

    -- Default: tudo zero
    (others => '0');

  -- espalhamento dos sinais
  RegDst   <= data(9);
  Jump     <= data(8);
  Branch   <= data(7) and (Zero xor instruction(26));
  MemToReg <= data(6);
  ALUOp    <= data(5 downto 3);
  MemWrite <= data(2);
  ALUSrc   <= data(1);
  RegWrite <= data(0);

end Behavioral;
