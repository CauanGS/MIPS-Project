library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DATA_MEMORY is
  port(
    clk : in std_logic;
    A   : in std_logic_vector(31 downto 0);
    WD  : in std_logic_vector(31 downto 0);
    WE  : in std_logic;
    RD  : out std_logic_vector(31 downto 0)
  );
end DATA_MEMORY;

architecture Behavioral of DATA_MEMORY is
  type mem_type is array(31 downto 0) of std_logic_vector(31 downto 0);
  signal mem : mem_type := (others => (others => '0'));
begin

  -- Escrita
  process(clk)
  begin
    if rising_edge(clk) then
      if WE = '1' then
        mem(to_integer(unsigned(A))) <= WD;
      end if;
    end if;
  end process;
  
  -- Leitura
  RD <= mem(to_integer(unsigned(A)));

end Behavioral;
