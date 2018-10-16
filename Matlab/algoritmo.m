function algoritmo(alfa, beta)
%Prueba el algoritmo a utilizar para la implementacion futura
%   Algoritmo que se utilizara posteriormente para la implementacion del
%   ocatavador y sus funciones en FPGA. Los parametros de entrada 
%   mezclan la se�al original y la octava respectivamente. Javier Otero
close all;

f1 = figure('Name','Stereo input signal','NumberTitle','off');
f2 = figure('Name','FFT input signal','NumberTitle','off');
f3 = figure('Name','FFT processed signal','NumberTitle','off');
f4 = figure('Name','Stereo output signal','NumberTitle','off');

FILE_IN = 'audio_prueba.wav';
%FILE_IN = 'audio_prueba_complejo.wav';
FILE_OUT = 'proc_audio.wav';

[y, Fs] = audioread(FILE_IN);
L = y(:,1);
R = y(:,2);

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

% Para graficar las FFT hay que editarlas
PLaux = abs(Y_L/len);
PL = PLaux(1:len/2+1);
PL(2:end-1) = 2*PL(2:end-1);

PRaux = abs(Y_R/len);
PR = PRaux(1:len/2+1);
PR(2:end-1) = 2*PR(2:end-1);

% Graficamos
figure(f2);
hold on;
subplot(2,1,1), plot(f, PL), title('FFT Left Channel'), xlabel('Frequency(Hz)');
subplot(2,1,2), plot(f, PR), title('FFT Right Channel'),xlabel('Frequency(Hz)');
hold off;

% Procesado de la se�al
[~, freqL] = max(PL);
[~, freqR] = max(PR);

movL = freqL/2;
movR = freqR/2;

uint32(movL);
uint32(movR);

% Left Channel
ampL = abs(Y_L);
phaL = unwrap(angle(Y_L));

ampL_pos = ampL(2:len/2+1);
ampL_neg = ampL(len/2+2:end);
phaL_pos = phaL(2:len/2+1);
phaL_neg = phaL(len/2+2:end);

ampL_pos_mov = [ampL_pos(movL+1:end);zeros(movL,1)];
phaL_pos_mov = [phaL_pos(movL+1:end);zeros(movL,1)];

ampL_neg_mov = [zeros(movL,1);ampL_neg(1:end-movL)];
phaL_neg_mov = [zeros(movL,1);phaL_neg(1:end-movL)];

ampL_out =[ampL(1);ampL_pos_mov; ampL_neg_mov];
phaL_out =[phaL(1);phaL_pos_mov; phaL_neg_mov];

outL_fft = ampL_out.*cos(phaL_out) + 1i*ampL_out.*sin(phaL_out);

% Right Channel
ampR = abs(Y_L);
phaR = unwrap(angle(Y_L));

ampR_pos = ampR(2:len/2+1);
ampR_neg = ampR(len/2+2:end);
phaR_pos = phaR(2:len/2+1);
phaR_neg = phaR(len/2+2:end);

ampR_pos_mov = [ampR_pos(movR+1:end);zeros(movR,1)];
phaR_pos_mov = [phaR_pos(movR+1:end);zeros(movR,1)];

ampR_neg_mov = [zeros(movR,1);ampR_neg(1:end-movR)];
phaR_neg_mov = [zeros(movR,1);phaR_neg(1:end-movR)];

ampR_out =[ampR(1);ampR_pos_mov; ampR_neg_mov];
phaR_out =[phaR(1);phaR_pos_mov; phaR_neg_mov];

outR_fft = ampR_out.*cos(phaR_out) + 1i*ampR_out.*sin(phaR_out);

final_R = real(ifft(outR_fft));
final_L = real(ifft(outL_fft));

% Y su correspondiente grafica
PLaux = abs(outL_fft/len);
PL = PLaux(1:len/2+1);
PL(2:end-1) = 2*PL(2:end-1);

PRaux = abs(outR_fft/len);
PR = PRaux(1:len/2+1);
PR(2:end-1) = 2*PR(2:end-1);
figure(f3);
hold on;
subplot(2,1,1), plot(f, PL), title('Processed FFT Left Channel'), xlabel('Frequency(Hz)');
subplot(2,1,2), plot(f, PR), title('Processed FFT Right Channel'),xlabel('Frequency(Hz)');
hold off;
% %sound(y, Fs);


% Creamos el sterero y mezclamos la se�al final 
out = zeros(length(final_L),2);
out(:,1) = final_L(:,1);
out(:,2) = final_R(:,1);

out = alfa.*y + beta.*out;

% Graficamos
figure(f4);
hold on;
subplot(3,1,1), plot(t,out), title(['Both Channels with \alpha = ', num2str(alfa),', \beta = ',num2str(beta)]), xlabel('Time(s)'), ylabel('Amplitude');
subplot(3,1,2), plot(t,out(:,1)), title('Left Channel (same mix)'), xlabel('Time(s)'), ylabel('Amplitude');
subplot(3,1,3), plot(t,out(:,2)), title('Right Channel (same mix)'),xlabel('Time(s)'), ylabel('Amplitude');
hold off;

% Reproducimos
sound(out,Fs);

% Guardamos en un archivo .wav
audiowrite(FILE_OUT, out, Fs);
end

