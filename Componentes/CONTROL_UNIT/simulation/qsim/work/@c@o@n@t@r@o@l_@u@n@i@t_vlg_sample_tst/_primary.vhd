library verilog;
use verilog.vl_types.all;
entity CONTROL_UNIT_vlg_sample_tst is
    port(
        instruction     : in     vl_logic_vector(31 downto 0);
        ZeroCarry       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CONTROL_UNIT_vlg_sample_tst;
