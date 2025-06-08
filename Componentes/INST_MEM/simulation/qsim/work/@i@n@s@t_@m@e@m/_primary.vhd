library verilog;
use verilog.vl_types.all;
entity INST_MEM is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        RD              : out    vl_logic_vector(31 downto 0)
    );
end INST_MEM;
