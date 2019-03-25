# 
# Synthesis run script generated by Vivado
# 

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
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
  D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/new/project_trunk.vhd
  D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/new/sampling.vhd
  D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/new/shift_register.vhd
  D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/new/memo_controller.vhd
  D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/new/master_controller.vhd
  D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/new/display_interface.vhd
  D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/new/display_counter.vhd
  {D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/imports/ROM Data/istft_window.vhd}
  {D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/imports/ROM Data/stft_window.vhd}
  D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/new/window_controller.vhd
  D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/new/fsm_global.vhd
}
read_ip -quiet D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/ram_memory/ram_memory.xci
set_property used_in_implementation false [get_files -all d:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/ram_memory/ram_memory_ooc.xdc]

read_ip -quiet D:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/clk_generator/clk_generator.xci
set_property used_in_implementation false [get_files -all d:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/clk_generator/clk_generator_board.xdc]
set_property used_in_implementation false [get_files -all d:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/clk_generator/clk_generator.xdc]
set_property used_in_implementation false [get_files -all d:/UNI/TFG/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/clk_generator/clk_generator_ooc.xdc]

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


synth_design -top fsm_global -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef fsm_global.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file fsm_global_utilization_synth.rpt -pb fsm_global_utilization_synth.pb"