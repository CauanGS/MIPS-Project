library verilog;
use verilog.vl_types.all;
entity processador_mips is
    port(
        BranchResult    : out    vl_logic;
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        BranchSinal     : out    vl_logic;
        JumpSinal       : out    vl_logic;
        ENTRADA_EXTENSOR: out    vl_logic_vector(15 downto 0);
        ENTRADA_SHIFT_LEFT: out    vl_logic_vector(31 downto 0);
        ENTRADA_ULA1    : out    vl_logic_vector(31 downto 0);
        ENTRADA_ULA2    : out    vl_logic_vector(31 downto 0);
        INSTR           : out    vl_logic_vector(31 downto 0);
        PC              : out    vl_logic_vector(31 downto 0);
        RESULTADO       : out    vl_logic_vector(31 downto 0);
        SAIDA_EXTENSOR  : out    vl_logic_vector(31 downto 0);
        SAIDA_SHIFT2L   : out    vl_logic_vector(31 downto 0)
    );
end processador_mips;
