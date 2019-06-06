fin = 4400;

Ftune = 440;

[input, Fs] = audioread('../Deprecated/audio_prueba_complejo.wav');
                
T = 1/Fs;             % Sampling period       
N   = 6;    % Order butterworth

%Registro del saxo
Fmax = Ftune*2^(16/12);
Fmin = Ftune*2^(-20/12);
%Rango de frecuencias del aparato
Ftotmax = 20000;
Ftotmin = 50;
bwmin = 50;

filter_number = 85;
tf = 1:1:filter_number;
% Crea las frecuencias de corte de los filtros
for i = 1:1:filter_number+1
    freq_filter(i) = (Ftotmax/Ftotmin)^(i/filter_number)*Ftotmin;
end

t = 1:1:length(input);
out = zeros(size(input(:,1)));

% Crea los objetos de filtro
%Hd = zeros(length(freq_filter),1);
for i = 1:1:filter_number
    Fc1 = freq_filter(i);   % First Cutoff Frequency
    Fc2 = freq_filter(i+1);  % Second Cutoff Frequency
    % Construct an FDESIGN object and call its BUTTER method.
    h  = fdesign.bandpass('N,F3dB1,F3dB2', N, Fc1, Fc2, Fs);
    Hd = design(h, 'butter');
    center_freq = freq_filter(i)+(freq_filter(i+1) - freq_filter(i))/2;
    
    filtered_sig = filter(Hd,input(:,1));
    shift = center_freq/2;
    sen_aux = sin(2*pi*t*shift)';
    cos_aux = cos(2*pi*t*shift)';
    
    hilbert_out = phase(hilbert(filtered_sig));

    out_pre = (cos_aux.*filtered_sig)+(hilbert_out.*sen_aux);
    out = out + out_pre;
end


audiowrite('hilbert_audio.wav',out,Fs);


% 
% for i = 1:1:filter_number
%     filterband(i,2) = (freq_filter(i+1)/freq_filter(i))^(i/2)*freq_filter(i);
%     filterband(i,1) = freq_filter(i);
%     filterband(i,3) = 2*filterband(i,2) - filterband(i,1);
%     bw(i) = filterband(i,3)-filterband(i,1);
% end
%







entrada = sin(2*pi*t*fin);

shift = fin/2;




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