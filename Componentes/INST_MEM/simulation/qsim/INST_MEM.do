onerror {quit -f}
vlib work
vlog -work work INST_MEM.vo
vlog -work work INST_MEM.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.INST_MEM_vlg_vec_tst
vcd file -direction INST_MEM.msim.vcd
vcd add -internal INST_MEM_vlg_vec_tst/*
vcd add -internal INST_MEM_vlg_vec_tst/i1/*
add wave /*
run -all
