transform_length = 512;

dphi = zeros(1,transform_length/2+1);
dphi(2:(1 + transform_length/2)) = (2*pi*hop)./(transform_length./(1:(transform_length/2)));


OUTPUT_FILE = 'phase_figure.txt';

%[filas, columnas] = size(win_bin_s);
fileID = fopen(OUTPUT_FILE,'wt');
for i = 1:1:transform_length/2+1
    fprintf(fileIDs, '"%s" when "%s",\n', win_bin_s(i,:),  sample_number(i,:));
end
fclose(fileID);