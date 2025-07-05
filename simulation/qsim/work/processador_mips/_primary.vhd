library verilog;
use verilog.vl_types.all;
entity processador_mips is
    port(
        BranchResult    : out    vl_logic;
        CLK_MANUAL      : in     vl_logic;
        RESET           : in     vl_logic;
        BranchSinal     : out    vl_logic;
        JumpSinal       : out    vl_logic;
        MemToReg        : out    vl_logic;
        MemWrite        : out    vl_logic;
        ULAsrc          : out    vl_logic;
        RegDest         : out    vl_logic;
        RegWrite        : out    vl_logic;
        ENTRADA_ULA1    : out    vl_logic_vector(31 downto 0);
        ENTRADA_ULA2    : out    vl_logic_vector(31 downto 0);
        HEX0            : out    vl_logic_vector(6 downto 0);
        HEX1            : out    vl_logic_vector(6 downto 0);
        HEX2            : out    vl_logic_vector(6 downto 0);
        HEX3            : out    vl_logic_vector(6 downto 0);
        HEX4            : out    vl_logic_vector(6 downto 0);
        HEX5            : out    vl_logic_vector(6 downto 0);
        HEX6            : out    vl_logic_vector(6 downto 0);
        HEX7            : out    vl_logic_vector(6 downto 0);
        INSTR           : out    vl_logic_vector(31 downto 0)
    );
end processador_mips;
