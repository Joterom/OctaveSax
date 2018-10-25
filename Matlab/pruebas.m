function pruebas
%PRUEBAS Summary of this function goes here
%   Detailed explanation goes here

close all;

FILE_IN = 'audio_prueba.wav';
%FILE_OUT_FULL = 'length_test_full.wav';
%FILE_OUT_TEST = 'length_test_specified.wav';

[y, Fs] = audioread(FILE_IN);

Ts = 1/Fs;
len = length(y);
max_time = (len*Ts)-Ts;
t = 0:Ts:max_time;
f = Fs*(0:(len/2))/length(y);
load('Hamming_filter.mat');

% f1 = figure('Name','Stereo input signal','NumberTitle','off');
% f2 = figure('Name','FFT input signal','NumberTitle','off');
f3 = figure('Name','FFT processed signal','NumberTitle','off');
%f4 = figure('Name','Stereo output signal','NumberTitle','off');

input_fft = fft(y);
out = zeros(size(y));

%y = filter(Num,1,y);

out(:,1) = abs(y(:,1).^3);
out(:,2) = abs(y(:,2).^3);




% Graficamos
grafica_entradaL = abs(input_fft(2:length(f)+1,1));
grafica_entradaR = abs(input_fft(2:length(f)+1,2));
maxLi = max(grafica_entradaL);
maxRi = max(grafica_entradaR);
grafica_salidaL = abs(out(2:length(f)+1,1));
grafica_salidaR = abs(out(2:length(f)+1,2));
maxLo = max(grafica_salidaL);
maxRo = max(grafica_salidaR);

for i = 1:length(grafica_entradaL)
    grafica_entradaL(i) = grafica_entradaL(i)./maxLi;
    grafica_entradaR(i) = grafica_entradaR(i)./maxRi;
    grafica_salidaL(i) = grafica_salidaL(i)./maxLo;
    grafica_salidaR(i) = grafica_salidaR(i)./maxRo;
end

figure(f3);
hold on;
subplot(2,2,1), plot(f, grafica_entradaL), title('FFT INPUT Left Channel'), xlabel('Frequency(Hz)');
xlim([0 22100])
subplot(2,2,2), plot(f, grafica_entradaR), title('FFT INPUT Right Channel'),xlabel('Frequency(Hz)');
xlim([0 22100])
subplot(2,2,3), plot(f, grafica_salidaL), title('FFT OUTPUT Left Channel'), xlabel('Frequency(Hz)');
xlim([0 22100])
subplot(2,2,4), plot(f, grafica_salidaR), title('FFT OUTPUT Right Channel'),xlabel('Frequency(Hz)');
xlim([0 22100])

hold off;

sound(out,Fs);
end

