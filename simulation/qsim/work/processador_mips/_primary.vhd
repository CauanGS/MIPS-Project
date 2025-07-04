library verilog;
use verilog.vl_types.all;
entity processador_mips is
    port(
        HEX0            : out    vl_logic_vector(6 downto 0);
        CLK             : in     vl_logic;
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0);
        HEX5            : out    vl_logic_vector(6 downto 0);
        HEX6            : out    vl_logic_vector(6 downto 0);
        HEX7            : out    vl_logic_vector(6 downto 0);
        PC              : out    vl_logic_vector(31 downto 0);
        RESULTADO       : out    vl_logic_vector(31 downto 0)
    );
end processador_mips;
