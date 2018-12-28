# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.cache/wt [current_project]
set_property parent.project_path D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo d:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/imports/new/pmod_clk_gen.vhd
  D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/new/project_trunk.vhd
  D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/new/sampling.vhd
  D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/new/shift_register.vhd
  D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/new/square_wave.vhd
}
read_ip -quiet D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/clock_change/clock_change.xci
set_property used_in_implementation false [get_files -all d:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/clock_change/clock_change_board.xdc]
set_property used_in_implementation false [get_files -all d:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/clock_change/clock_change.xdc]
set_property used_in_implementation false [get_files -all d:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/clock_change/clock_change_ooc.xdc]
set_property is_locked true [get_files D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/clock_change/clock_change.xci]

read_ip -quiet D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/fft_module/fft_module.xci
set_property used_in_implementation false [get_files -all d:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/fft_module/fft_module_ooc.xdc]
set_property is_locked true [get_files D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/fft_module/fft_module.xci]

read_ip -quiet D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/ram_memo/ram_memo.xci
set_property used_in_implementation false [get_files -all d:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/ram_memo/ram_memo_ooc.xdc]
set_property is_locked true [get_files D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/ram_memo/ram_memo.xci]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/constrs_1/imports/Downloads/Nexys4DDR_Master.xdc
set_property used_in_implementation false [get_files D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/constrs_1/imports/Downloads/Nexys4DDR_Master.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

synth_design -top sampling -part xc7a100tcsg324-1


write_checkpoint -force -noxdef sampling.dcp

catch { report_utilization -file sampling_utilization_synth.rpt -pb sampling_utilization_synth.pb }
