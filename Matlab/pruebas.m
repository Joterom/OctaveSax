function pruebas
%PRUEBAS Summary of this function goes here
%   Detailed explanation goes here

close all;

FILE_IN = 'tono_saxo_440Hz.wav';
%FILE_OUT_FULL = 'length_test_full.wav';
%FILE_OUT_TEST = 'length_test_specified.wav';

[y, Fs] = audioread(FILE_IN);
Ts = 1/Fs;
len = length(y);
max_time = (len*Ts)-Ts;
t = 0:Ts:max_time;
f = Fs*(0:(len/2))/len;

load('Hamming_filter.mat');

% f1 = figure('Name','Stereo input signal','NumberTitle','off');
% f2 = figure('Name','FFT input signal','NumberTitle','off');
f3 = figure('Name','FFT processed signal','NumberTitle','off');
%f4 = figure('Name','Stereo output signal','NumberTitle','off');

% a = 1*sin(2*pi*200*t);
% b = 0.3*sin(2*pi*400*t);
% signal = a + b;

signal_fft = fft(y);

plot_signal(1) = abs(signal_fft(1));
plot_signal(2:len/2+1) = 2*abs(signal_fft(2:len/2+1));

signal_proc = y.^2;
signal_proc_fft = fft(signal_proc);

plot_proc_signal(1) = 0;
plot_proc_signal(2:len/2+1) = 2*abs(signal_proc_fft(2:len/2+1));

max_plot = max(plot_signal);
max_proc_plot = max(plot_proc_signal);

plot_signal = plot_signal./max_plot;
plot_proc_signal = plot_proc_signal./max_proc_plot;

figure(f3);
hold on;
subplot(2,1,1), plot(f, plot_signal), title('FFT INPUT Left Channel'), xlabel('Frequency(Hz)');
xlim([0 22100])
subplot(2,1,2), plot(f, plot_proc_signal), title('FFT INPUT Right Channel'),xlabel('Frequency(Hz)');
xlim([0 22100])
hold off;

% sound(out,Fs);
end

