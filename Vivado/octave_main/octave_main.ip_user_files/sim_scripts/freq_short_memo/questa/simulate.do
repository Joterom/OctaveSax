onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib freq_short_memo_opt

do {wave.do}

view wave
view structure
view signals

do {freq_short_memo.udo}

run -all

quit -force
