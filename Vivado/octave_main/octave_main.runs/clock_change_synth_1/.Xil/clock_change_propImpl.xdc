set_property SRC_FILE_INFO {cfile:/home/joterom/workspace/OctaveSax/Vivado/octave_main/octave_main.srcs/sources_1/ip/clock_change/clock_change.xdc rfile:../../../octave_main.srcs/sources_1/ip/clock_change/clock_change.xdc id:1 order:EARLY scoped_inst:inst} [current_design]
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_100MHz]] 0.1
