library verilog;
use verilog.vl_types.all;
entity processador_mips_vlg_check_tst is
    port(
        Output          : in     vl_logic_vector(4 downto 0);
        sampler_rx      : in     vl_logic
    );
end processador_mips_vlg_check_tst;
