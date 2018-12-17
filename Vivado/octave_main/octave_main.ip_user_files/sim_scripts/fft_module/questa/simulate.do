onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fft_module_opt

do {wave.do}

view wave
view structure
view signals

do {fft_module.udo}

run -all

quit -force
