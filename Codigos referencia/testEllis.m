function max_lat = testEllis(FILE_IN, samples_delayed)
%Testea el algoritmo de Ellis con los parámetros prefijados
%   Emula el comportamiento real de la implementacion montando el fragmento
%   octavado sobre el original, que se pasa como parametro. Tambien
%   devuelve la latencia maxima (ms) segun el numero de muestras de retardo.

% LATENCIA MAXIMA SOPORTABLE DE 25ms o 3000 muestras
close all;
% Configuracion de las graficas
f1 = figure('Name','Input and Output','NumberTitle','off');
f2 = figure('Name','Frequency domain','NumberTitle','off');
% Configuracion de los archivos de escritura
FILE_OUT = 'Audio/Octaved audio.wav';
FILE_MIX = 'Audio/Mixed audio.wav';

% Begin
[in, Fs] = audioread(FILE_IN);

in_mono = in(:,1);

out = algoritmo_final(in_mono)';

t = 1:1:length(in_mono);

mix = zeros(size(out));
mix(1:samples_delayed) = 0.5.*in_mono(1:samples_delayed);
mix(samples_delayed+1:end) = 0.5.*in_mono(samples_delayed+1:end) + 0.5.*out(1:end-samples_delayed);
max_lat = 1/105*samples_delayed;

% Gestion de las FFT para las graficas
in_fft = fft(in_mono);
out_fft = fft(out);

in_fft_plot = 2*abs(in_fft(1:length(in_fft)/2+1));
in_fft_plot(1) = in_fft(1);
in_fft_plot = in_fft_plot./max(in_fft_plot);

out_fft_plot = 2*abs(out_fft(1:length(out_fft)/2+1));
out_fft_plot(1) = out_fft(1);
out_fft_plot = out_fft_plot./max(out_fft_plot);

f = 1:1:length(out_fft)/2+1;
% Graficas
f_lim = 0.7;
figure(f1)
subplot(3,1,1), plot(t,in_mono), title('Input'), xlabel('Sample'), ylabel('Amplitude');
xlim([0 length(t)]);
ylim([-f_lim f_lim]);
subplot(3,1,2), plot(t,out), title('Octaved input'), xlabel('Sample'), ylabel('Amplitude');
xlim([0 length(t)]);
ylim([-f_lim f_lim]);
subplot(3,1,3), plot(t,mix), title('Mixed output'), xlabel('Sample'), ylabel('Amplitude');
xlim([0 length(t)]);
ylim([-f_lim f_lim]);


f_lim = 1;
x_lim = 15000;
figure(f2)
subplot(2,1,1), plot(f,in_fft_plot), title('Input (normalized)'), xlabel('Freq.');
xlim([0 x_lim]);
ylim([0 f_lim]);
subplot(2,1,2), plot(f,out_fft_plot), title('Octaved Input (normalized)'), xlabel('Freq.');
xlim([0 x_lim]);
ylim([0 f_lim]);

audiowrite(FILE_OUT,out,Fs);
audiowrite(FILE_MIX,mix,Fs);
end

