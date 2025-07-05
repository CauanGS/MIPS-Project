library verilog;
use verilog.vl_types.all;
entity processador_mips_vlg_check_tst is
    port(
        BranchResult    : in     vl_logic;
        BranchSinal     : in     vl_logic;
        ENTRADA_ULA1    : in     vl_logic_vector(31 downto 0);
        ENTRADA_ULA2    : in     vl_logic_vector(31 downto 0);
        HEX0            : in     vl_logic_vector(6 downto 0);
        HEX1            : in     vl_logic_vector(6 downto 0);
        HEX2            : in     vl_logic_vector(6 downto 0);
        HEX3            : in     vl_logic_vector(6 downto 0);
        HEX4            : in     vl_logic_vector(6 downto 0);
        HEX5            : in     vl_logic_vector(6 downto 0);
        HEX6            : in     vl_logic_vector(6 downto 0);
        HEX7            : in     vl_logic_vector(6 downto 0);
        INSTR           : in     vl_logic_vector(31 downto 0);
        JumpSinal       : in     vl_logic;
        MemToReg        : in     vl_logic;
        MemWrite        : in     vl_logic;
        RegDest         : in     vl_logic;
        RegWrite        : in     vl_logic;
        ULAsrc          : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end processador_mips_vlg_check_tst;
