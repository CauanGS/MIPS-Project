library verilog;
use verilog.vl_types.all;
entity CONTROL_UNIT is
    port(
        instruction     : in     vl_logic_vector(31 downto 0);
        ZeroCarry       : in     vl_logic;
        RegDst          : out    vl_logic;
        Jump            : out    vl_logic;
        Branch          : out    vl_logic;
        MemRead         : out    vl_logic;
        MemToReg        : out    vl_logic;
        ALUOp           : out    vl_logic_vector(3 downto 0);
        MemWrite        : out    vl_logic;
        ALUSrc          : out    vl_logic;
        RegWrite        : out    vl_logic
    );
end CONTROL_UNIT;
