function rev_algoritmo
%Prueba el algoritmo a utilizar para la implementacion futura
%   Algoritmo que se utilizara posteriormente para la implementacion del
%   ocatavador y sus funciones en FPGA. Los parametros de entrada 
%   mezclan la señal original y la octava respectivamente. Javier Otero
close all;

f1 = figure('Name','Stereo input signal','NumberTitle','off');
f2 = figure('Name','Normalized FFT input signal','NumberTitle','off');
% f3 = figure('Name','FFT processed signal','NumberTitle','off');
% f4 = figure('Name','Stereo output signal','NumberTitle','off');

FILE_IN = 'audio_prueba.wav';
% FILE_OUT = 'octaved_audio.wav';

[y, Fs] = audioread(FILE_IN);
L = y(:,1);
R = y(:,2);

% Declaracion de variables
Ts = 1/Fs;
max_time = (length(L)*Ts)-Ts;
t = 0:Ts:max_time;
len = length(L);
f = Fs*(0:(len/2))/len;

%Grafica del audio de entrada
figure(f1);
hold on;
subplot(3,1,1), plot(t,y), title('Both Channels'), xlabel('Time(s)'), ylabel('Amplitude');
subplot(3,1,2), plot(t,L), title('Left Channel'), xlabel('Time(s)'), ylabel('Amplitude');
subplot(3,1,3), plot(t,R), title('Right Channel'),xlabel('Time(s)'), ylabel('Amplitude');
hold off;

% Transformadas de la entrada
Y_L = fft(L);
Y_R = fft(R);

% Para graficar las FFT hay que editarlas y normalizarlas
PLaux = abs(Y_L/len);
PL = PLaux(1:len/2+1);
PL(2:end-1) = 2*PL(2:end-1);
PL_max = max(PL);
PL_plot = PL./PL_max;

PRaux = abs(Y_R/len);
PR = PRaux(1:len/2+1);
PR(2:end-1) = 2*PR(2:end-1);
PR_max = max(PR);
PR_plot = PR./PR_max;

% Graficamos
figure(f2);
hold on;
subplot(2,1,1), plot(f, PL_plot), title('FFT Left Channel'), xlabel('Frequency(Hz)');
subplot(2,1,2), plot(f, PR_plot), title('FFT Right Channel'),xlabel('Frequency(Hz)');
hold off;

% % Reproducimos
% sound(out,Fs);
% 
% % Guardamos en un archivo .wav
% audiowrite(FILE_OUT, out, Fs);
end

