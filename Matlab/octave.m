function audio_out = octave(audio_in, Fs)
%OCTAVE Octava el parametro introducido
%   Aplica el algoritmo de octavacion para el parametro introducido (en
%   estereo) pudiendose aplicar a fragmentos de diferentes longitudes

in_L = audio_in(:,1);
in_R = audio_in(:,2);

Ts = 1/Fs;
max_time = (length(in_L)*Ts)-Ts;
t = 0:Ts:max_time;
len = length(in_L);
f = Fs*(0:(len/2))/len;

transform_L = fft(in_L);
transform_R = fft(in_R);

L_continua = transform_L(1);
L_positiva = transform_L(2:len/2+1);
proc_L_positiva = zeros(size(L_positiva));
for i = 1:length(L_positiva)/2
    proc_L_positiva(i) = L_positiva(2*i);
end
proc_L = zeros(size(transform_L));
proc_L(1) = L_continua;
proc_L(2:len/2+1) = proc_L_positiva;
proc_L(len/2+2:end) = fliplr(proc_L_positiva(1:end-1)')';

R_continua = transform_R(1);
R_positiva = transform_R(2:len/2+1);
proc_R_positiva = zeros(size(R_positiva));
for i = 1:length(R_positiva)/2
    proc_R_positiva(i) = R_positiva(2*i);
end
proc_R = zeros(size(transform_R));
proc_R(1) = R_continua;
proc_R(2:len/2+1) = proc_R_positiva;
proc_R(len/2+2:end) = fliplr(proc_R_positiva(1:end-1)')';

audio_out(:,1) = real(ifft(proc_L));
audio_out(:,2) = real(ifft(proc_R));

end

