onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+freq_short_memo -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.freq_short_memo xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {freq_short_memo.udo}

run -all

endsim

quit -force
