transform_length = 512;
data_width = 16;
STFT_FILE = 'stft_window.vhd';
ISTFT_FILE = 'istft_window.vhd';

stft_window_entity_name = 'stft_window_rom';
istft_window_entity_name = 'istft_window_rom';

variable_in = 'in_frame';
variable_out = 'out_win';

halflen = transform_length/2;
halfwin = 0.5 * ( 1 + cos( pi * (0:halflen)/halflen));
win_stft = zeros(1, transform_length);
win_stft((halflen+1):(halflen+halflen)) = halfwin(1:halflen);
win_stft((halflen+1):-1:(halflen-halflen+2)) = halfwin(1:halflen);

win_istft = win_stft.*2./3;

win_stft = win_stft.*(2^(data_width-1));
win_istft = win_istft.*(2^(data_width-1));

win_bin_s = dec2bin(win_stft,data_width);
win_bin_i = dec2bin(win_istft,data_width);
s = 0:1:transform_length-1;
sample_number = dec2bin(s,log2(transform_length));


%[filas, columnas] = size(win_bin_s);
fileIDs = fopen(STFT_FILE,'wt');
fileIDi = fopen(ISTFT_FILE,'wt');
% Encabezados
fprintf(fileIDs, '-- Javier Otero Martinez\n-- OctaveSax project -- TFG\n-- June 2019\n\nlibrary IEEE;\nuse IEEE.STD_LOGIC_1164.ALL;\n\n');
fprintf(fileIDi, '-- Javier Otero Martinez\n-- OctaveSax project -- TFG\n-- June 2019\n\nlibrary IEEE;\nuse IEEE.STD_LOGIC_1164.ALL;\n\n');
% Entity
fprintf(fileIDs, 'entity %s is Port (\n\t%s : in STD_LOGIC_VECTOR(%d downto 0);\n\t%s : out STD_LOGIC_VECTOR(%d downto 0)\n\t);\nend %s;\n\n',stft_window_entity_name, variable_in, log2(transform_length)-1, variable_out, data_width-1, stft_window_entity_name);
fprintf(fileIDi, 'entity %s is Port (\n\t%s : in STD_LOGIC_VECTOR(%d downto 0);\n\t%s : out STD_LOGIC_VECTOR(%d downto 0)\n\t);\nend %s;\n\n',istft_window_entity_name, variable_in, log2(transform_length)-1, variable_out, data_width-1, istft_window_entity_name);
% Architcture
fprintf(fileIDs, 'architecture Behavioral of %s is\n\n\tbegin\n\n', stft_window_entity_name);
fprintf(fileIDi, 'architecture Behavioral of %s is\n\n\tbegin\n\n', istft_window_entity_name);
% with/select statement
fprintf(fileIDs, '\twith %s select %s <=\n', variable_in, variable_out);
fprintf(fileIDi, '\twith %s select %s <=\n', variable_in, variable_out);
% Values
for i = 2:1:transform_length
    fprintf(fileIDs, '\t\t"%s" when "%s",\n', win_bin_s(i,:),  sample_number(i,:));
    fprintf(fileIDi, '\t\t"%s" when "%s",\n', win_bin_i(i,:),  sample_number(i,:));
end
%Default and first value
fprintf(fileIDs, '\t\t"0000000000000000" when others;\n');
fprintf(fileIDi, '\t\t"0000000000000000" when others;\n');

fprintf(fileIDs, 'end Behavioral');
fprintf(fileIDi, 'end Behavioral');

fclose(fileIDs);
fclose(fileIDi);