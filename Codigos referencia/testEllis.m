function max_lat = testEllis(FILE_IN, samples_delayed)
%MAIN Summary of this function goes here
%   Detailed explanation goes here
close all;

f1 = figure('Name','Input and Output','NumberTitle','off');
f2 = figure('Name','Frequency domain','NumberTitle','off');
f3 = figure('Name','Ellis Vs FPGA','NumberTitle','off');

FILE_OUT = 'Octaved audio.wav';
FILE_MIX = 'Mixed audio.wav';
FILE_OUT_FPGA = 'Octaved FPGA audio.wav';
[in, Fs] = audioread(FILE_IN);

in_mono = in(:,1);

vocoder = pvoc(in_mono,2,256);
out_prev = resample(vocoder,2,1);

t = 1:1:length(in_mono);
out = out_prev(1:length(in_mono));

in_fft = fft(in_mono);
out_fft = fft(out);

in_fft_plot = 2*abs(in_fft(1:length(in_fft)/2+1));
in_fft_plot(1) = in_fft(1);

out_fft_plot = 2*abs(out_fft(1:length(out_fft)/2+1));
out_fft_plot(1) = out_fft(1);

out_fpga = algoritmo_final(in_mono)';

f = 1:1:length(out_fft)/2+1;

figure(f1)
subplot(2,1,1), plot(t,in_mono), title('Input'), xlabel('Sample'), ylabel('Amplitude');
xlim([0 length(t)]);
ylim([-0.7 0.7]);
subplot(2,1,2), plot(t,out), title('Output'), xlabel('Sample'), ylabel('Amplitude');
xlim([0 length(t)]);
ylim([-0.7 0.7]);

figure(f2)
subplot(2,1,1), plot(f,in_fft_plot), title('Input'), xlabel('Freq.');
xlim([0 length(f)]);
ylim([0 20000]);
subplot(2,1,2), plot(f,out_fft_plot), title('Output'), xlabel('Freq.');
xlim([0 length(f)]);
ylim([0 20000]);

figure(f3)
subplot(2,1,1), plot(t,out), title('Input'), xlabel('Sample');
xlim([0 length(t)]);
ylim([-0.7 0.7]);
subplot(2,1,2), plot(t,out_fpga), title('Output'), xlabel('Sample');
xlim([0 length(t)]);
ylim([-0.7 0.7]);

mix = zeros(size(out));
mix(1:samples_delayed-1) = 0.5.*in_mono(1:samples_delayed-1);
mix(samples_delayed:end) = 0.5.*in_mono(samples_delayed:end) + 0.5.*out(1:end-samples_delayed+1);
max_lat = 1/105000*samples_delayed;

audiowrite(FILE_OUT,out,Fs);
audiowrite(FILE_OUT_FPGA,out_fpga,Fs);
audiowrite(FILE_MIX,mix,Fs);
end

