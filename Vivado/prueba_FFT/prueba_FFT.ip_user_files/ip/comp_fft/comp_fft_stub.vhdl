-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
-- Date        : Mon Oct  1 10:59:00 2018
-- Host        : DESKTOP-DR3C0JT running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/UNI/TFG/OctaveSax/Vivado/prueba_FFT/prueba_FFT.srcs/sources_1/ip/comp_fft/comp_fft_stub.vhdl
-- Design      : comp_fft
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a75tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comp_fft is
  Port ( 
    aclk : in STD_LOGIC;
    aclken : in STD_LOGIC;
    s_axis_config_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_config_tvalid : in STD_LOGIC;
    s_axis_config_tready : out STD_LOGIC;
    s_axis_data_tdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axis_data_tvalid : in STD_LOGIC;
    s_axis_data_tready : out STD_LOGIC;
    s_axis_data_tlast : in STD_LOGIC;
    m_axis_data_tdata : out STD_LOGIC_VECTOR ( 47 downto 0 );
    m_axis_data_tvalid : out STD_LOGIC;
    m_axis_data_tlast : out STD_LOGIC;
    event_frame_started : out STD_LOGIC;
    event_tlast_unexpected : out STD_LOGIC;
    event_tlast_missing : out STD_LOGIC;
    event_data_in_channel_halt : out STD_LOGIC
  );

end comp_fft;

architecture stub of comp_fft is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "aclk,aclken,s_axis_config_tdata[7:0],s_axis_config_tvalid,s_axis_config_tready,s_axis_data_tdata[31:0],s_axis_data_tvalid,s_axis_data_tready,s_axis_data_tlast,m_axis_data_tdata[47:0],m_axis_data_tvalid,m_axis_data_tlast,event_frame_started,event_tlast_unexpected,event_tlast_missing,event_data_in_channel_halt";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "xfft_v9_0_12,Vivado 2017.2";
begin
end;