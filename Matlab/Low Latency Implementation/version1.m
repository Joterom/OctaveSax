fin = 4400;

Ftune = 440;

Fs = 44100;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1000;             % Length of signal
t = (0:L-1)*T;        % Time vector
%Registro del saxo
Fmax = Ftune*2^(16/12);
Fmin = Ftune*2^(-20/12);
%Rango de frecuencias del aparato
Ftotmax = 20000;
Ftotmin = 400;
bwmin = 50;

filter_number = 85;
tf = 1:1:filter_number;

for i = 1:1:filter_number+1
    freq_filter(i) = (Ftotmax/Ftotmin)^(i/filter_number)*Ftotmin;
end

for i = 1:1:filter_number
    filterband(i,2) = (freq_filter(i+1)/freq_filter(i))^(i/2)*freq_filter(i);
    filterband(i,1) = freq_filter(i);
    filterband(i,3) = 2*filterband(i,2) - filterband(i,1);
    bw(i) = filterband(i,3)-filterband(i,1);
end

entrada = sin(2*pi*t*fin);

shift = fin/2;

sen_aux = sin(2*pi*t*shift);
cos_aux = cos(2*pi*t*shift);

hilbert_out = imag(hilbert(entrada));

out = (cos_aux.*entrada)+(hilbert_out.*sen_aux);
%out = (hilbert_out.*sen_aux);


for i = 1:1:37
    freq_sax(i) = Fmin*2^((i-1)/12);
end


fft_in_aux = fft(entrada);
fft_out_aux = fft(out);

f = 1:1:length(fft_in_aux)/2+1;

fft_in = 2*abs(fft_in_aux(1:length(fft_in_aux)/2+1));
fft_in(1) = fft_in_aux(1);
in_fft_plot = fft_in./max(fft_in);

fft_out = 2*abs(fft_out_aux(1:length(fft_out_aux)/2+1));
fft_out(1) = fft_out_aux(1);
out_fft_plot = fft_out./max(fft_out);

subplot(1,2,1), plot(f,abs(in_fft_plot));
subplot(1,2,2), plot(f,abs(out_fft_plot));