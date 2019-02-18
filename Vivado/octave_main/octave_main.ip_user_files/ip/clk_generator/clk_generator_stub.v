// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
// Date        : Mon Feb 18 17:01:38 2019
// Host        : vhdl-2018 running 64-bit Ubuntu 18.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/joterom/workspace/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/clk_generator/clk_generator_stub.v
// Design      : clk_generator
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_generator(clk_100MHz, clk_50MHz, clk_fpga)
/* synthesis syn_black_box black_box_pad_pin="clk_100MHz,clk_50MHz,clk_fpga" */;
  output clk_100MHz;
  output clk_50MHz;
  input clk_fpga;
endmodule
