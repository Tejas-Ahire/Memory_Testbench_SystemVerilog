# Creating Workspace
#vlib work

# Compilation command
vlog tb.sv

# Optimization command
vopt top +cover=fcbest -o misMatching

# Elaboration command
vsim -coverage misMatching +test_name=misMatching

# Saving Coverage
coverage save -onexit misMatching.ucdb

# Add wave signals
add wave -r sim:/top/pif/*

# Run all simulation
run -all

