function tesis_1
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%Prueba el algoritmo a utilizar para la implementacion futura
%   Algoritmo que se utilizara posteriormente para la implementacion del
%   ocatavador y sus funciones en FPGA. Los parametros de entrada 
%   mezclan la señal original y la octava respectivamente. Javier Otero
close all;

% f1 = figure('Name','Stereo input signal','NumberTitle','off');
% f2 = figure('Name','Normalized input signal FFT','NumberTitle','off');
% f3 = figure('Name','Processed signal FFT','NumberTitle','off');
% f4 = figure('Name','Stereo output signal','NumberTitle','off');

FILE_IN = 'billies_bounce.wav';
FILE_OUT = 'salidas/billies_bounce.wav';

[y, Fs] = audioread(FILE_IN);
L = y(:,1);
R = y(:,2);

% PARAMETROS DEL ALGORITMO
lower_note_freq = 138.591;
higher_note_freq = 1108.73;
ring_buffer_size = round(lower_note_freq*4);
fc_lowpass_filter = 1200;
C = 3/8;
T = round(higher_note_freq-lower_note_freq);
L_CorrWin = round(C*T);
L_SearchArea = round((1-C)*T);
L_CrossFade = ;
%interpolation_filter_length
N = 5000;
amax = 0.5;
dmax = 2/lower_note_freq;
dmin = (amax - 1)*L_CrossFade+N/2;


% Declaracion de variables
Ts = 1/Fs;
max_time = (length(L)*Ts)-Ts;
t = 0:Ts:max_time;
len = length(L);
f = Fs*(0:(len/2))/len;


Lup = upsample(L,2);

for i = 1:len/2-1
    Lup(2*i) = (Lup(2*i-1)+Lup(2*i+1))/2;
end

Lproc = downsample(Lup,2);

subplot(2,1,1), stem(t,L);
subplot(2,1,2), stem(t,Lproc);

end

