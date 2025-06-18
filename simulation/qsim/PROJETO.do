onerror {quit -f}
vlib work
vlog -work work PROJETO.vo
vlog -work work PROJETO.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.PROJETO_vlg_vec_tst
vcd file -direction PROJETO.msim.vcd
vcd add -internal PROJETO_vlg_vec_tst/*
vcd add -internal PROJETO_vlg_vec_tst/i1/*
add wave /*
run -all
