vlib work
vlog tb.sv
vsim -novopt -suppress 12110 top +test_name=NWR_NRD +N=10
add wave -r sim:/top/*
run -all

