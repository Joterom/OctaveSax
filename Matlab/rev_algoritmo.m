function rev_algoritmo
%Prueba el algoritmo a utilizar para la implementacion futura
%   Algoritmo que se utilizara posteriormente para la implementacion del
%   ocatavador y sus funciones en FPGA. Los parametros de entrada 
%   mezclan la señal original y la octava respectivamente. Javier Otero
close all;

f1 = figure('Name','Stereo input signal','NumberTitle','off');
f2 = figure('Name','Normalized input signal FFT','NumberTitle','off');
f3 = figure('Name','Processed signal FFT','NumberTitle','off');
f4 = figure('Name','Stereo output signal','NumberTitle','off');

FILE_IN = 'audio_prueba_complejo.wav';
FILE_OUT = 'octaved_audio.wav';

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

% Procesado
L_continua = Y_L(1);
L_positiva = Y_L(2:len/2+1);
proc_L_positiva = zeros(size(L_positiva));
for i = 1:length(L_positiva)/2
    proc_L_positiva(i) = L_positiva(2*i);
end
proc_L = zeros(size(Y_L));
proc_L(1) = L_continua;
proc_L(2:len/2+1) = proc_L_positiva;
proc_L(len/2+2:end) = fliplr(proc_L_positiva(1:end-1)')';

R_continua = Y_R(1);
R_positiva = Y_R(2:len/2+1);
proc_R_positiva = zeros(size(R_positiva));
for i = 1:length(R_positiva)/2
    proc_R_positiva(i) = R_positiva(2*i);
end
proc_R = zeros(size(Y_R));
proc_R(1) = R_continua;
proc_R(2:len/2+1) = proc_R_positiva;
proc_R(len/2+2:end) = fliplr(proc_R_positiva(1:end-1)')';

% Graficamos
PLaux = abs(proc_L/len);
PL = PLaux(1:len/2+1);
PL(2:end-1) = 2*PL(2:end-1);
PL_max = max(PL);
PL_plot = PL./PL_max;

PRaux = abs(proc_R/len);
PR = PRaux(1:len/2+1);
PR(2:end-1) = 2*PR(2:end-1);
PR_max = max(PR);
PR_plot = PR./PR_max;

figure(f3);
hold on;
subplot(2,1,1), plot(f, PL_plot), title('FFT Left Channel'), xlabel('Frequency(Hz)');
subplot(2,1,2), plot(f, PR_plot), title('FFT Right Channel'),xlabel('Frequency(Hz)');
hold off;

% Reconstruccion final
final_L = real(ifft(proc_L));
final_R = real(ifft(proc_R));

out = zeros(size(y));
out(:,1) = final_L(:,1);
out(:,2) = final_R(:,1);

%Graficamos la salida
figure(f4);
hold on;
subplot(3,1,1), plot(t,out), title('Both Channels'), xlabel('Time(s)'), ylabel('Amplitude');
subplot(3,1,2), plot(t,final_L), title('Left Channel'), xlabel('Time(s)'), ylabel('Amplitude');
subplot(3,1,3), plot(t,final_R), title('Right Channel'),xlabel('Time(s)'), ylabel('Amplitude');
hold off;

% Reproducimos
sound(out,Fs);

% Guardamos en un archivo .wav
audiowrite(FILE_OUT, out, Fs);
end

