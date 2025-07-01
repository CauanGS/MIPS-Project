library verilog;
use verilog.vl_types.all;
entity processador_mips_vlg_sample_tst is
    port(
        INPUTA          : in     vl_logic_vector(4 downto 0);
        INPUTB          : in     vl_logic_vector(4 downto 0);
        SINAL           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end processador_mips_vlg_sample_tst;
