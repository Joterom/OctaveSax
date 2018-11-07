function [ y ] = main
%MAIN Summary of this function goes here
%   Detailed explanation goes here

f1 = figure('Name','FFT vs STFT','NumberTitle','off');

Fs = 1000;
T = 1/Fs;
L = 1024;
t = (0:L-1)*T;

si = sin(2*pi*300*t);

si_aux = fft(si);
si_fft = 2*abs(si_aux(1:513));
si_fft(1) = si_aux(1);

f = (0:length(si_fft)-1)*T;

si_stft_aux = stft(si);
si_stft = zeros(size(si_fft));
si_stft(1:97) = si_stft_aux(1:97,1);
si_stft(98:128) = si_stft_aux(97:129,1) + si_stft_aux(1:32,2);
si_stft(129:162) = si_stft_aux(33:96,2);
si_stft(163:196) = si_stft_aux(97:129,2) + si_stft_aux(1:32,3);




figure(f1)
subplot(2,1,1), plot(f,si_fft), title('Input'), xlabel('Time(s)'), ylabel('Amplitude');
subplot(2,1,2), plot(f,si_stft), title('Output'), xlabel('Time(s)'), ylabel('Amplitude');
end

