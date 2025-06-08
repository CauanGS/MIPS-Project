library verilog;
use verilog.vl_types.all;
entity INST_MEM_vlg_check_tst is
    port(
        RD              : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end INST_MEM_vlg_check_tst;
