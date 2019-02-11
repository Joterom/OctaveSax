-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (lin64) Build 2086221 Fri Dec 15 20:54:30 MST 2017
-- Date        : Mon Feb 11 17:50:07 2019
-- Host        : vhdl-2018 running 64-bit Ubuntu 18.04.1 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/joterom/workspace/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/clock_change/clock_change_stub.vhdl
-- Design      : clock_change
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_change is
  Port ( 
    clk_48MHz : out STD_LOGIC;
    clk_100MHz : in STD_LOGIC
  );

end clock_change;

architecture stub of clock_change is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_48MHz,clk_100MHz";
begin
end;
