library verilog;
use verilog.vl_types.all;
entity PROJETO is
    port(
        ALU_result      : out    vl_logic_vector(31 downto 0);
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0);
        HEX5            : out    vl_logic_vector(6 downto 0);
        HEX6            : out    vl_logic_vector(6 downto 0);
        HEX7            : out    vl_logic_vector(6 downto 0);
        MUX_INPUT1      : out    vl_logic_vector(31 downto 0);
        MUX_INPUT2      : out    vl_logic_vector(31 downto 0);
        MUX_INPUT3      : out    vl_logic_vector(27 downto 0);
        MUX_INPUT4      : out    vl_logic_vector(31 downto 0);
        PC              : out    vl_logic_vector(31 downto 0);
        PCplus4         : out    vl_logic_vector(31 downto 0);
        RD1             : out    vl_logic_vector(31 downto 0);
        RD2             : out    vl_logic_vector(31 downto 0)
    );
end PROJETO;
