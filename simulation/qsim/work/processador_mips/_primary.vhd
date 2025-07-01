library verilog;
use verilog.vl_types.all;
entity processador_mips is
    port(
        Output          : out    vl_logic_vector(4 downto 0);
        SINAL           : in     vl_logic;
        INPUTA          : in     vl_logic_vector(4 downto 0);
        INPUTB          : in     vl_logic_vector(4 downto 0)
    );
end processador_mips;
