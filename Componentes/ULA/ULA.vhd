library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ULA is
	GENERIC(n : integer := 32);
	port(
			-- Inputs
			operand_1 : in std_logic_vector(n - 1 downto 0);
			operand_2 : in std_logic_vector(n - 1 downto 0);
			ALU_control: in std_logic_vector(3 downto 0); -- 9 Operations

			-- Outputs
			result : out std_logic_vector(n - 1 downto 0);
			zero : out std_logic
		);
end ULA;

architecture Behavioral of ULA is
	signal temp : std_logic_vector(n - 1 downto 0);
	signal is_zero : std_logic;
begin
	-- ALU Operations
	with ALU_control select
		temp <= std_logic_vector(unsigned(operand_1) + unsigned(operand_2)) when "0000",
				std_logic_vector(unsigned(operand_1) - unsigned(operand_2)) when "0001",
				operand_1 AND operand_2 when "0010",
        		operand_1 OR operand_2 when "0011",
        		operand_1 NOR operand_2 when "0100",
        		operand_1 NAND operand_2 when "0101",
        		operand_1 XOR operand_2 when "0110",
				std_logic_vector(shift_left(unsigned(operand_1), to_integer(unsigned(operand_2)))) when "0111",
        		std_logic_vector(shift_right(unsigned(operand_1), to_integer(unsigned(operand_2)))) when "1000",
        		(others => '0') when others;

    -- Zero Detection
	process(temp)
	begin
		is_zero <= '1';
		for i in 0 to n - 1 loop
			if temp(i) /= '0' then
				is_zero <= '0';
				exit;
			end if;
		end loop;	
	end process;
	
	zero <= is_zero;

	-- Output Result
	result <= temp;
end Behavioral;