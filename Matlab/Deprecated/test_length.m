function test_length(pot)
%TEST_LENGTH Prueba diferentes tama�os de ventana en la FFT
%   Permite realizar la FFT del archivo de entrada especificada con un
%   tama�o de ventana especificado como parametro.

close all;

FILE_IN = 'audio_prueba_complejo.wav';
FILE_OUT_FULL = 'length_test_full.wav';
FILE_OUT_TEST = 'length_test_specified.wav';

[y, Fs] = audioread(FILE_IN);

Ts = 1/Fs;
max_time = (length(y)*Ts)-Ts;
t = 0:Ts:max_time;
ventana = 2^pot;
f = Fs*(0:(length(y)/2))/length(y);

f4 = figure('Name','Stereo output signal','NumberTitle','off');
f3 = figure('Name','FFT Comparison','NumberTitle','off');

%Transformada directa para comprobar
y_ext = zeros(length(y)*2,2);
y_ext(1:length(y),:) = y(:,:);
comprobacion_largo = octave(y_ext,Fs);
comprobacion = comprobacion_largo(1:length(y),:);


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
subplot(3,2,4), plot(t,comprobacion(:,2)), title('Full length FFT RIGHT'), ylabel('Amplitude');

subplot(3,2,2), plot(t,result), title('Specified length BOTH'), ylabel('Amplitude');
subplot(3,2,5), plot(t,result(:,1)), title('Specified length LEFT'), ylabel('Amplitude');
subplot(3,2,6), plot(t,result(:,2)), title('Specified length RIGHT'), xlabel('Time(s)'), ylabel('Amplitude');
hold off;

% Graficamos las FFT
comprobacion_L = fft(comprobacion(:,1));
comprobacion_R = fft(comprobacion(:,2));
Y_L = fft(y(:,1));
Y_R = fft(y(:,2));
result_L = fft(result(:,1));
result_R = fft(result(:,2));


% Para graficar las FFT hay que editarlas y normalizarlas
PLaux = abs(comprobacion_L/length(y));
PL = PLaux(1:length(y)/2+1);
PL(2:end-1) = 2*PL(2:end-1);
PL_max = max(PL);
PL_plot_comp = PL./PL_max;

PRaux = abs(comprobacion_R/length(y));
PR = PRaux(1:length(y)/2+1);
PR(2:end-1) = 2*PR(2:end-1);
PR_max = max(PR);
PR_plot_comp = PR./PR_max;

PLaux = abs(Y_L/length(y));
PL = PLaux(1:length(y)/2+1);
PL(2:end-1) = 2*PL(2:end-1);
PL_max = max(PL);
PL_plot_orig = PL./PL_max;

PRaux = abs(Y_R/length(y));
PR = PRaux(1:length(y)/2+1);
PR(2:end-1) = 2*PR(2:end-1);
PR_max = max(PR);
PR_plot_orig = PR./PR_max;

PLaux = abs(result_L/length(y));
PL = PLaux(1:length(y)/2+1);
PL(2:end-1) = 2*PL(2:end-1);
PL_max = max(PL);
PL_plot = PL./PL_max;

PRaux = abs(result_R/length(y));
PR = PRaux(1:length(y)/2+1);
PR(2:end-1) = 2*PR(2:end-1);
PR_max = max(PR);
PR_plot = PR./PR_max;

% Graficamos
figure(f3);
hold on;
subplot(3,2,1), plot(f,PL_plot_orig), title('FREQ: Original signal LEFT'), xlabel('Frequency');
subplot(3,2,2), plot(f,PR_plot_orig), title('FREQ: Original signal RIGHT'), xlabel('Frequency');
subplot(3,2,3), plot(f,PL_plot_comp), title('FREQ: Full length FFT LEFT'), xlabel('Frequency');
subplot(3,2,4), plot(f,PR_plot_comp), title('FREQ: Full length FFT RIGHT'), xlabel('Frequency');
subplot(3,2,5), plot(f,PL_plot), title('FREQ: Specified length LEFT'), xlabel('Frequency');
subplot(3,2,6), plot(f,PR_plot), title('FREQ: Specified length RIGHT'), xlabel('Frequency');
hold off;

% Reproducimos
% sound(out,Fs);

% Guardamos en un archivo .wav
audiowrite(FILE_OUT_FULL, comprobacion, Fs);
audiowrite(FILE_OUT_TEST, result, Fs);



