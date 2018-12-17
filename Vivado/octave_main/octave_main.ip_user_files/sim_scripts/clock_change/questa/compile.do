vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../octave_main.srcs/sources_1/ip/clock_change" "+incdir+../../../../octave_main.srcs/sources_1/ip/clock_change" \
"C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../../octave_main.srcs/sources_1/ip/clock_change/clock_change_sim_netlist.vhdl" \


vlog -work xil_defaultlib \
"glbl.v"

