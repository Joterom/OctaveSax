transform_length = 512;
data_width = 16;
STFT_FILE = 'stft_window.txt';
ISTFT_FILE = 'istft_window.txt';

halflen = transform_length/2;
halfwin = 0.5 * ( 1 + cos( pi * (0:halflen)/halflen));
win_stft = zeros(1, transform_length);
win_stft((halflen+1):(halflen+halflen)) = halfwin(1:halflen);
win_stft((halflen+1):-1:(halflen-halflen+2)) = halfwin(1:halflen);

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
    fprintf(fileIDs, '"%s" when "%s",\n', win_bin_s(i,:),  sample_number(i,:));
    fprintf(fileIDi, '"%s" when "%s",\n', win_bin_i(i,:),  sample_number(i,:));
end
<<<<<<< HEAD
=======
%Default and first value
fprintf(fileIDs, '\t\t"0000000000000000" when others;\n');
fprintf(fileIDi, '\t\t"0000000000000000" when others;\n');

fprintf(fileIDs, 'end Behavioral;');
fprintf(fileIDi, 'end Behavioral;');

>>>>>>> alpalo
fclose(fileIDs);
fclose(fileIDi);