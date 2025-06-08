onerror {quit -f}
vlib work
vlog -work work CONTROL_UNIT.vo
vlog -work work CONTROL_UNIT.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.CONTROL_UNIT_vlg_vec_tst
vcd file -direction CONTROL_UNIT.msim.vcd
vcd add -internal CONTROL_UNIT_vlg_vec_tst/*
vcd add -internal CONTROL_UNIT_vlg_vec_tst/i1/*
add wave /*
run -all
