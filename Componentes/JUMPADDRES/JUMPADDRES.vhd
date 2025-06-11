LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY JUMPADDRES IS
    PORT (
        pc_plus_four_bits : IN  STD_LOGIC_VECTOR(31 DOWNTO 00);
        jump_address_bits : IN  STD_LOGIC_VECTOR(27 DOWNTO 0);
        full_jump_address : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
    );
END JUMPADDRES;

ARCHITECTURE Behavioral OF JUMPADDRES IS
BEGIN
    full_jump_address <= pc_plus_four_bits(31 DOWNTO 28) & jump_address_bits;
END Behavioral;