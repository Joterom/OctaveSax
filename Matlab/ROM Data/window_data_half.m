transform_length = 512;
data_width = 16;
STFT_FILE = 'stft_windowPRUEBA.vhd';
ISTFT_FILE = 'istft_windowPRUEBA.vhd';

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

s = 0:1:transform_length-1;
sample_number = dec2bin(s,log2(transform_length));

for i = 1:1:transform_length
    if (i >= transform_length/4+1) && (i <= transform_length*3/4)
    fprintf(fileIDs, '\t\t"0111111111111111" when "%s",\n',  sample_number(i,:));
    fprintf(fileIDi, '\t\t"0111111111111111" when "%s",\n',  sample_number(i,:));
    else
    fprintf(fileIDi, '\t\t"0111111111111111" when "%s",\n',  sample_number(i,:));
    %fprintf(fileIDi, '\t\t"0111111111111111" when "%s",\n',  sample_number(i,:));
    fprintf(fileIDs, '\t\t"0011111111111111" when "%s",\n',  sample_number(i,:));   
    end
end

%Default and first value
fprintf(fileIDi, '\t\t"0111111111111111" when others;\n');
%fprintf(fileIDi, '\t\t"0100000000000000" when others;\n');
fprintf(fileIDs, '\t\t"0011111111111111" when others;\n');


fprintf(fileIDs, '\nend Behavioral;');
fprintf(fileIDi, '\nend Behavioral;');

fclose(fileIDs);
fclose(fileIDi);