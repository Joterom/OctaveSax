transform_length = 512;
data_width = 16;
STFT_FILE = 'stft_window.vhd';
ISTFT_FILE = 'istft_window.vhd';


halflen = transform_length/2;
halfwin = 0.5 * ( 1 + cos( pi * (0:halflen)/halflen));
win_stft = zeros(1, transform_length);
win_stft((halflen+1):(halflen+halflen)) = halfwin(1:halflen);
win_stft((halflen+1):-1:(halflen-halflen+2)) = halfwin(1:halflen);
win_istft = win_stft.*2./3;
%x = [0.25 0.5 0.75];
%a = fi(x,0,16,15);

win_stft = win_stft.*(2^(data_width-1));
win_istft = win_istft.*(2^(data_width-1));
win_bin_s = dec2bin(win_stft,data_width);
win_bin_i = dec2bin(win_istft,data_width);

s = 0:1:transform_length-1;
sample_number = dec2bin(s,log2(transform_length));


%[filas, columnas] = size(win_bin_s);
fileIDs = fopen(STFT_FILE,'wt');
fileIDi = fopen(ISTFT_FILE,'wt');
fprintf(fileIDs, 'library IEEE;\nuse IEEE.STD_LOGIC_1164.ALL;\n\nentity stft_window_rom is Port (\n');
fprintf(fileIDi, 'library IEEE;\nuse IEEE.STD_LOGIC_1164.ALL;\n\nentity istft_window_rom is Port (\n');

fprintf(fileIDs, '\tin_frame : in STD_LOGIC_VECTOR(8 downto 0);\n\tout_win : out STD_LOGIC_VECTOR(15 downto 0));\nend stft_window_rom;');
fprintf(fileIDi, '\tin_frame : in STD_LOGIC_VECTOR(8 downto 0);\n\tout_win : out STD_LOGIC_VECTOR(15 downto 0));\nend istft_window_rom;');

fprintf(fileIDs, '\n\narchitecture Behavioral of stft_window_rom is\n\n\tbegin\n');
fprintf(fileIDi, '\n\narchitecture Behavioral of istft_window_rom is\n\n\tbegin\n');

fprintf(fileIDs, '\n\twith in_frame select out_win <=\n');
fprintf(fileIDi, '\n\twith in_frame select out_win <=\n');

for i = 1:1:transform_length
    fprintf(fileIDs, '\t\t"%s" when "%s",\n', win_bin_s(i,:),  sample_number(i,:));
    fprintf(fileIDi, '\t\t"%s" when "%s",\n', win_bin_i(i,:),  sample_number(i,:));
end

%Default and first value
fprintf(fileIDs, '\t\t"0000000000000000" when others;\n');
fprintf(fileIDi, '\t\t"0000000000000000" when others;\n');

fprintf(fileIDs, 'end Behavioral;');
fprintf(fileIDi, 'end Behavioral;');

fclose(fileIDs);
fclose(fileIDi);