library verilog;
use verilog.vl_types.all;
entity PROJETO_vlg_sample_tst is
    port(
        Clock           : in     vl_logic;
        Reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end PROJETO_vlg_sample_tst;
