-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
-- Date        : Mon Feb 18 17:01:38 2019
-- Host        : vhdl-2018 running 64-bit Ubuntu 18.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/joterom/workspace/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/clk_generator/clk_generator_stub.vhdl
-- Design      : clk_generator
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_generator is
  Port ( 
    clk_100MHz : out STD_LOGIC;
    clk_50MHz : out STD_LOGIC;
    clk_fpga : in STD_LOGIC
  );

end clk_generator;

architecture stub of clk_generator is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_100MHz,clk_50MHz,clk_fpga";
begin
end;
