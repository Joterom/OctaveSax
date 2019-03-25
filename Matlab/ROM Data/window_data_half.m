transform_length = 512;
data_width = 16;
STFT_FILE = 'stft_windowMEDIO.txt';
ISTFT_FILE = 'istft_windowMEDIO.txt';


halflen = transform_length/2;
halfwin = 0.5 * ( 1 + cos( pi * (0:halflen)/halflen));
win_stft = zeros(1, transform_length);
win_stft((halflen+1):(halflen+halflen)) = halfwin(1:halflen);
win_stft((halflen+1):-1:(halflen-halflen+2)) = halfwin(1:halflen);
% LLENAR LAS DEMOS
% win_stft(1:transform_length/4) = 0.5;
% win_stft(transform_length/4+1:transform_length*3/4) = 1;
% win_stft(transform_length*3/4+1:end) = 0.5;
% HASTA AQUI
win_istft = win_stft.*2./3;
x = [0.25 0.5 0.75];
a = fi(x,0,16,15);

win_stft = win_stft.*(2^data_width-1);
win_istft = win_istft.*(2^data_width-1);
win_bin_s = dec2bin(win_stft,data_width);
win_bin_i = dec2bin(win_istft,data_width);
s = 0:1:transform_length-1;
sample_number = dec2bin(s,log2(transform_length));


%[filas, columnas] = size(win_bin_s);
fileIDs = fopen(STFT_FILE,'wt');
fileIDi = fopen(ISTFT_FILE,'wt');
for i = 1:1:transform_length
    if (i >= transform_length/4+1) && (i <= transform_length*3/4)
    fprintf(fileIDs, '"1111111111111111" when "%s",\n',  sample_number(i,:));
    fprintf(fileIDi, '"1111111111111111" when "%s",\n',  sample_number(i,:));
    else
    fprintf(fileIDs, '"0111111111111111" when "%s",\n',  sample_number(i,:));
    fprintf(fileIDi, '"0111111111111111" when "%s",\n',  sample_number(i,:));   
    end
end

%Default and first value
fprintf(fileIDs, '\t\t"0111111111111111" when others;\n');
fprintf(fileIDi, '\t\t"0111111111111111" when others;\n');

fprintf(fileIDs, 'end Behavioral;');
fprintf(fileIDi, 'end Behavioral;');

fclose(fileIDs);
fclose(fileIDi);