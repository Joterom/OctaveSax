// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Wed Dec 12 17:13:24 2018
// Host        : DESKTOP-DR3C0JT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/UNI/TFG/octave_main/octave_main.srcs/sources_1/ip/clock_change/clock_change_stub.v
// Design      : clock_change
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clock_change(clk_22MHz, clk_100MHz)
/* synthesis syn_black_box black_box_pad_pin="clk_22MHz,clk_100MHz" */;
  output clk_22MHz;
  input clk_100MHz;
endmodule
