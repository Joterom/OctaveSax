#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2017.4 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Thu Apr 11 16:12:40 CEST 2019
# SW Build 2086221 on Fri Dec 15 20:54:30 MST 2017
#
# Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep xsim main_tb_behav -key {Behavioral:sim_1:Functional:main_tb} -tclbatch main_tb.tcl -view /home/joterom/workspace/OctaveSax/Vivado/octave_main/octave_main.srcs/sim_1/imports/octave_main/test.wcfg -view /home/joterom/workspace/OctaveSax/Vivado/octave_main/window_tb_behav.wcfg -view /home/joterom/workspace/OctaveSax/Vivado/octave_main/fft.wcfg -log simulate.log
