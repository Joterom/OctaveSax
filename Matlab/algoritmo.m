function algoritmo
%Prueba el algoritmo a utilizar para la implementacion futura
%   Algoritmo que se utilizara posteriormente para la implementacion del
%   ocatavador y sus funciones en FPGA. Javier Otero
close all;

f1 = figure('Name','Stereo input signal','NumberTitle','off');
f2 = figure('Name','FFT input signal','NumberTitle','off');
f3 = figure('Name','FFT proccessed signal','NumberTitle','off');

FILE = 'audio_prueba.wav';

[y, Fs] = audioread(FILE);
L = y(:,1);
R = y(:,1);

Ts = 1/Fs;
max_time = (length(L)*Ts)-Ts;
t = 0:Ts:max_time;
len = length(L);
f = Fs*(0:(len/2))/len;

%Grafica del audio de entrada
figure(f1);
hold on;
subplot(2,1,1), plot(t,L), title('Left Channel'), xlabel('Time(s)'), ylabel('Normalized amplitude');
subplot(2,1,2), plot(t,R), title('Right Channel'),xlabel('Time(s)'), ylabel('Normalized amplitude');
hold off;

Y_L = fft(L);
Y_R = fft(R);

PLaux = abs(Y_L/len);
PL = PLaux(1:len/2+1);
PL(2:end-1) = 2*PL(2:end-1);

PRaux = abs(Y_R/len);
PR = PRaux(1:len/2+1);
PR(2:end-1) = 2*PR(2:end-1);

figure(f2);
hold on;
subplot(2,1,1), plot(f, PL), title('FFT Left Channel'), xlabel('Frequency(Hz)');
subplot(2,1,2), plot(f, PR), title('FFT Right Channel'),xlabel('Frequency(Hz)');
hold off;

proc_L = zeros(length(PL),1);
proc_R = zeros(length(PR),1);

for i = 1:(length(PL))/2 
    proc_L(i) = PL(2*i);
    proc_R(i) = PR(2*i);
end

figure(f3);
hold on;
subplot(2,1,1), plot(f, proc_L), title('FFT Left Channel'), xlabel('Frequency(Hz)');
subplot(2,1,2), plot(f, proc_R), title('FFT Right Channel'),xlabel('Frequency(Hz)');
hold off;
%sound(y, Fs);

final_L = ifft(proc_L);
final_R = ifft(proc_R);

out = zeros(length(final_L),2);
out(:,1) = final_L(:,1);
out(:,2) = final_R(:,1);

sound(out,Fs/2);
end

