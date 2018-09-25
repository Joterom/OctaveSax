function [error_f, error_t] = test_length(ventana)
%TEST_LENGTH Prueba diferentes tama�os de ventana en la FFT
%   Permite realizar la FFT del archivo de entrada especificada con un
%   tama�o de ventana especificado como parametro.

close all;

FILE_IN = 'audio_prueba.wav';
FILE_OUT = 'tested_window_audio.wav';

[y, Fs] = audioread(FILE_IN);
L = y(:,1);
R = y(:,2);

Ts = 1/Fs;
max_time = (length(L)*Ts)-Ts;
t = 0:Ts:max_time;
f = Fs*(0:(length(L)/2))/length(L);

f1 = figure('Name','Stereo input signal','NumberTitle','off');
f3 = figure('Name','Full Vs Specified length FFT','NumberTitle','off');
f4 = figure('Name','Stereo output signal','NumberTitle','off');

% Graficas de la entrada
figure(f1);
hold on;
subplot(3,1,1), plot(t,y), title('Both Channels'), xlabel('Time(s)'), ylabel('Amplitude');
subplot(3,1,2), plot(t,L), title('Left Channel'), xlabel('Time(s)'), ylabel('Amplitude');
subplot(3,1,3), plot(t,R), title('Right Channel'),xlabel('Time(s)'), ylabel('Amplitude');
hold off;

%Transformada directa para comprobar
comprobacion_freq = abs(fft(y));
comprobacion_t = real(ifft(comprobacion_freq));

PLaux = abs(comprobacion_freq(:,1)/length(L));
PL = PLaux(1:length(L)/2+1);
PL(2:end-1) = 2*PL(2:end-1);
PL_max = max(PL);
PL_plot_full = PL./PL_max;

PRaux = abs(comprobacion_freq(:,2)/length(R));
PR = PRaux(1:length(R)/2+1);
PR(2:end-1) = 2*PR(2:end-1);
PR_max = max(PR);
PR_plot_full = PR./PR_max;

%Transformada con la ventana especificada
num_bloques = floor(length(y)/ventana);
ultimo_bloque = mod(length(y),ventana);
result_L = zeros(size(L)); 
result_R = zeros(size(R)); 

for i = 0:num_bloques-1
    operandoL = L(i*ventana + 1:(i + 1)*ventana, 1);
    operandoR = R(i*ventana + 1:(i + 1)*ventana, 1);
    transformed_L = fft(operandoL);
    transformed_R = fft(operandoR);
    result_L(i*ventana + 1:(i + 1)*ventana, 1) = real(ifft(transformed_L));
    result_R(i*ventana + 1:(i + 1)*ventana, 1) = real(ifft(transformed_R));
end
% Ultimas muestras y padding
operandoL = zeros(ventana,1); 
operandoR = zeros(ventana,1);
operandoL(1:ultimo_bloque,1) = L(ventana*num_bloques + 1:end);
operandoR(1:ultimo_bloque,1) = R(ventana*num_bloques + 1:end);
transformed_L = fft(operandoL);
transformed_R = fft(operandoR);
time_L = real(ifft(transformed_L));
time_R = real(ifft(transformed_R));
result_L(num_bloques*ventana + 1:end, 1) = time_L(1:ultimo_bloque,1);
result_R(num_bloques*ventana + 1:end, 1) = time_R(1:ultimo_bloque,1);

%Graficamos para comparar
PLaux = abs(comprobacion_freq(:,1)/length(L));
PL = PLaux(1:length(L)/2+1);
PL(2:end-1) = 2*PL(2:end-1);
PL_max = max(PL);
PL_plot = PL./PL_max;

PRaux = abs(comprobacion_freq(:,2)/length(R));
PR = PRaux(1:length(R)/2+1);
PR(2:end-1) = 2*PR(2:end-1);
PR_max = max(PR);
PR_plot = PR./PR_max;

figure(f3);
hold on;
subplot(4,1,1), plot(f, PL_plot_full), title('Full length FFT Left'), xlabel('Frequency(Hz)');
subplot(4,1,2), plot(f, PR_plot_full), title('Full length FFT Right'),xlabel('Frequency(Hz)');
subplot(4,1,3), plot(f, PL_plot), title([num2str(ventana) ,' points FFT Left']), xlabel('Frequency(Hz)');
subplot(4,1,4), plot(f, PR_plot), title([num2str(ventana) ,' points FFT Right']), xlabel('Frequency(Hz)');
hold off;

% Montaje de la se�al final
out(:,1) = result_L(:,1);
out(:,2) = result_R(:,1);

error_t = mean(abs(out./comprobacion_t));
error_f = (mean(abs(result_L./comprobacion_freq(:,1))) + mean(abs(result_L./comprobacion_freq(:,1))))/2;

%Graficamos la salida
figure(f4);
hold on;
subplot(3,1,1), plot(t,out), title('Both Channels'), xlabel('Time(s)'), ylabel('Amplitude');
subplot(3,1,2), plot(t,result_L), title('Left Channel'), xlabel('Time(s)'), ylabel('Amplitude');
subplot(3,1,3), plot(t,result_R), title('Right Channel'),xlabel('Time(s)'), ylabel('Amplitude');
hold off;

% Reproducimos
% sound(out,Fs);

% Guardamos en un archivo .wav
audiowrite(FILE_OUT, out, Fs);



