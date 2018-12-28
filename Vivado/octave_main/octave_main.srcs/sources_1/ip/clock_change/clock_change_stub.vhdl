-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
-- Date        : Fri Dec 28 12:36:36 2018
-- Host        : DESKTOP-DR3C0JT running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top clock_change -prefix
--               clock_change_ clock_change_stub.vhdl
-- Design      : clock_change
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_change is
  Port ( 
    clk_48MHz : out STD_LOGIC;
    clk_30MHz : out STD_LOGIC;
    clk_100MHz : in STD_LOGIC
  );

end clock_change;

architecture stub of clock_change is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_48MHz,clk_30MHz,clk_100MHz";
begin
end;
