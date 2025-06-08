library verilog;
use verilog.vl_types.all;
entity CONTROL_UNIT_vlg_check_tst is
    port(
        ALUOp           : in     vl_logic_vector(3 downto 0);
        ALUSrc          : in     vl_logic;
        Branch          : in     vl_logic;
        Jump            : in     vl_logic;
        MemRead         : in     vl_logic;
        MemToReg        : in     vl_logic;
        MemWrite        : in     vl_logic;
        RegDst          : in     vl_logic;
        RegWrite        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end CONTROL_UNIT_vlg_check_tst;
