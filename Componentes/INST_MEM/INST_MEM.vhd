library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity INST_MEM is
  port( 
        -- Entrada
        A  : in  std_logic_vector(31 downto 0);

        -- Saída
        RD : out std_logic_vector(31 downto 0)
     );
end INST_MEM;

architecture Behavioral of INST_MEM is
    type reg is array (0 to 63) of std_logic_vector(7 downto 0);
    signal instr_memory: reg := (
        -- 		Load here your software.

        -- 		Example code:
        -- 		# Set operands. In this example, multiplies 6x4
		  --		# So, in fact, this algorithm sums 6 times 4
		  --		addi $s1, $0, 2
		  --		addi $s2, $0, 4

		  --		# Set counters
		  --		addi $s0, $0, 0
		  --		addi $s3, $0, 0
		  
		  --		for:
		  --		beq $s0, $s1, continue
		  --		  add $s3, $s3, $s2
		  --		  addi $s0, $s0, 1
		  --		  j for
		  --		continue:
		  --		# The result is stored in $s3 memory position
		  
		  x"20",x"11",x"00",x"02",
		  x"20",x"12",x"00",x"04",
		  x"20",x"10",x"00",x"00",
		  x"20",x"13",x"00",x"00",
		  x"12",x"11",x"00",x"03",
		  x"02",x"72",x"98",x"20",
		  x"22",x"10",x"00",x"01",
		  x"08",x"00",x"00",x"04",

		  others=> x"00");

begin
    -- Concatena quatro bytes sucessivos da memória para formar uma instrução de 32 bits
    RD <= instr_memory(to_integer(unsigned(A)))     &
          instr_memory(to_integer(unsigned(A) + 1)) &
          instr_memory(to_integer(unsigned(A) + 2)) &
          instr_memory(to_integer(unsigned(A) + 3));
end Behavioral;
