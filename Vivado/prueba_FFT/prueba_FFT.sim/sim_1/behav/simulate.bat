@echo off
set xv_path=C:\\Xilinx\\Vivado\\2017.2\\bin
call %xv_path%/xsim modulo_fft_tb_behav -key {Behavioral:sim_1:Functional:modulo_fft_tb} -tclbatch modulo_fft_tb.tcl -view D:/UNI/TFG/prueba_FFT/modulo_fft_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
