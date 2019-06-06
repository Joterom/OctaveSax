function prueba_algoritmo
%PRUEBA_ALGORITMO Summary of this function goes here
%   Detailed explanation goes here

%FILE_IN = 'audio_prueba.wav';
FILE_IN = 'audio_prueba_complejo.wav';
FILE_OUT = 'prueba_rapida_audio.wav';

[y, Fs] = audioread(FILE_IN);
L = y(:,1);
R = y(:,2);

Ts = 1/Fs;
len = length(L);
max_time = (len*Ts)-Ts;
t = 0:Ts:max_time;
f = Fs*(0:(len/2))/len;

f_L = filter(Hd,L);
f_R = filter(Hd,R);

out = zeros(size(y));

for i = 1:len
    out(i,1) = f_L(i)^2;
    out(i,2) = f_R(i)^2;
end

end

