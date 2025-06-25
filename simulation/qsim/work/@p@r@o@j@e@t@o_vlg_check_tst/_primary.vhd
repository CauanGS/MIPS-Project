library verilog;
use verilog.vl_types.all;
entity PROJETO_vlg_check_tst is
    port(
        ALU_result      : in     vl_logic_vector(31 downto 0);
        HEX0            : in     vl_logic_vector(6 downto 0);
        HEX1            : in     vl_logic_vector(6 downto 0);
        HEX2            : in     vl_logic_vector(6 downto 0);
        HEX3            : in     vl_logic_vector(6 downto 0);
        HEX4            : in     vl_logic_vector(6 downto 0);
        HEX5            : in     vl_logic_vector(6 downto 0);
        HEX6            : in     vl_logic_vector(6 downto 0);
        HEX7            : in     vl_logic_vector(6 downto 0);
        MUX_INPUT1      : in     vl_logic_vector(31 downto 0);
        MUX_INPUT2      : in     vl_logic_vector(31 downto 0);
        MUX_INPUT3      : in     vl_logic_vector(27 downto 0);
        MUX_INPUT4      : in     vl_logic_vector(31 downto 0);
        PC              : in     vl_logic_vector(31 downto 0);
        PCplus4         : in     vl_logic_vector(31 downto 0);
        RD1             : in     vl_logic_vector(31 downto 0);
        RD2             : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end PROJETO_vlg_check_tst;
