onerror {quit -f}
vlib work
vlog -work work processador_mips.vo
vlog -work work processador_mips.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.processador_mips_vlg_vec_tst
vcd file -direction processador_mips.msim.vcd
vcd add -internal processador_mips_vlg_vec_tst/*
vcd add -internal processador_mips_vlg_vec_tst/i1/*
add wave /*
run -all
