function test_length(pot)
%TEST_LENGTH Prueba diferentes tamaños de ventana en la FFT
%   Permite realizar la FFT del archivo de entrada especificada con un
%   tamaño de ventana especificado como parametro.

close all;

FILE_IN = 'audio_prueba.wav';
FILE_OUT_FULL = 'full_window_audio.wav';
FILE_OUT_TEST = 'tested_window_audio.wav';

[y, Fs] = audioread(FILE_IN);
L = y(:,1);
R = y(:,2);

Ts = 1/Fs;
max_time = (length(L)*Ts)-Ts;
t = 0:Ts:max_time;
ventana = 2^pot;

f4 = figure('Name','Stereo output signal','NumberTitle','off');

%Transformada directa para comprobar
comprobacion = octave(y,Fs);


%Transformada con la ventana especificada
num_bloques = floor(length(y)/ventana);
ultimo_bloque = mod(length(y),ventana);
result = zeros(size(y)); 

for i = 0:num_bloques-1
    operando = y(i*ventana + 1:(i + 1)*ventana, :);
    result(i*ventana + 1:(i + 1)*ventana, :) = octave(operando,Fs);
end

% Ultimas muestras y padding
operando = zeros(ventana,2); 
operando(1:ultimo_bloque,:) = y(ventana*num_bloques + 1:end, :);
oct = octave(operando,Fs);
result(num_bloques*ventana + 1:end, :) = oct(1:ultimo_bloque,:);


%Graficamos la salida
figure(f4);
hold on;
subplot(3,2,1), plot(t,comprobacion), title('Full length FFT BOTH'), ylabel('Amplitude');
subplot(3,2,3), plot(t,comprobacion(:,1)), title('Full length FFT LEFT'), ylabel('Amplitude');
subplot(3,2,5), plot(t,comprobacion(:,2)), title('Full length FFT RIGHT'), ylabel('Amplitude');

subplot(3,2,2), plot(t,result), title('Specified length BOTH'), ylabel('Amplitude');
subplot(3,2,4), plot(t,result(:,1)), title('Specified length LEFT'), ylabel('Amplitude');
subplot(3,2,6), plot(t,result(:,2)), title('Specified length RIGHT'), xlabel('Time(s)'), ylabel('Amplitude');
hold off;

% Reproducimos
% sound(out,Fs);

% Guardamos en un archivo .wav
audiowrite(FILE_OUT_FULL, comprobacion, Fs);
audiowrite(FILE_OUT_TEST, result, Fs);



