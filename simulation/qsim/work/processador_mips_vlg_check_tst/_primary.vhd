library verilog;
use verilog.vl_types.all;
entity processador_mips_vlg_check_tst is
    port(
        BranchResult    : in     vl_logic;
        BranchSinal     : in     vl_logic;
        ENTRADA_EXTENSOR: in     vl_logic_vector(15 downto 0);
        ENTRADA_SHIFT_LEFT: in     vl_logic_vector(31 downto 0);
        ENTRADA_ULA1    : in     vl_logic_vector(31 downto 0);
        ENTRADA_ULA2    : in     vl_logic_vector(31 downto 0);
        INSTR           : in     vl_logic_vector(31 downto 0);
        JumpSinal       : in     vl_logic;
        PC              : in     vl_logic_vector(31 downto 0);
        RESULTADO       : in     vl_logic_vector(31 downto 0);
        SAIDA_EXTENSOR  : in     vl_logic_vector(31 downto 0);
        SAIDA_SHIFT2L   : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end processador_mips_vlg_check_tst;
