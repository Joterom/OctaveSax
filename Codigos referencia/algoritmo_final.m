function out = algoritmo_final( input )
%ALGORITMO_FINAL Algoritmo de Ellis ajustado y tal como se va a introducir
%     en la FPGA
%   Utiliza el algoritmo de Ellis para implementar un octavador. Requiere
%   de varias operacioes "complejas" que hay que buscar para implemntar en
%   FPGA:
%     - Coseno
%     - Exponencial
%     - Arcotangente
%     - FFT/iFFT

r = 2;
transform_length = 512;
hop = transform_length/4;


% STFT +++++++++++++++++++++++++++++++++++++++++++++++
% Espera la entrada como una fila, si no, la transpone
if size(input,1) > 1
  input = input';
end

s = length(input);
w1 = transform_length;

% Enventanado para la STFT
if rem(w1, 2) == 0   % La ventana debe de ser impar
  w1 = w1 + 1;
end
halflen = (w1-1)/2;
halff = transform_length/2;   % punto medio de la ventana
halfwin = 0.5 * ( 1 + cos( pi * (0:halflen)/halflen));
win_stft = zeros(1, transform_length);
acthalflen = min(halff, halflen);
win_stft((halff+1):(halff+acthalflen)) = halfwin(1:acthalflen);
win_stft((halff+1):-1:(halff-acthalflen+2)) = halfwin(1:acthalflen);

% Inicializa el array de salida y las variables necesarias
stft_signal = zeros((1+transform_length/2),1+fix((s-transform_length)/hop));
c_stft = 1;
% Realiza la FFT utilizando una columna por cada ventana
for i = 0:hop:(s-transform_length)
  frame = win_stft.*input((i+1):(i+transform_length));
  tot = fft(frame);
  stft_signal(:,c_stft) = tot(1:(1+transform_length/2))';
  c_stft = c_stft+1;
end;

% PVSAMPLE +++++++++++++++++++++++++++++++++++++++++++++++++

[rows, cols] = size(stft_signal);
t = 0:r:(cols-2);
% Tiene cuidado con las columnas porque se inicializa en 0 y hace falta la
% ventana siguiente para eo solapamiento

num = 2*(rows-1);

% Inicializa el array de salida
pv_signal = zeros(rows, length(t));

% Calcula la fase a esperar
dphi = zeros(1,num/2+1);
dphi(2:(1 + num/2)) = (2*pi*hop)./(num./(1:(num/2)));

% Acumulador de fase
% Se inicializa la fase de todas las muestras de la primera trama
ph = angle(stft_signal(:,1));

% Incluye una columna de seguridad para evitar problemas
stft_signal = [stft_signal,zeros(rows,1)];

ocol = 1;
for i = t
  % Coge dos coulmnas
  bcols = stft_signal(:,floor(i)+[1 2]);
  tf = i - floor(i);
  bmag = (1-tf)*abs(bcols(:,1)) + tf*(abs(bcols(:,2)));
  % Calcula la fase siguiente
  dp = angle(bcols(:,2)) - angle(bcols(:,1)) - dphi';
  % La reduce a rango de -pi, pi
  dp = dp - 2 * pi * round(dp/(2*pi));
  % Save the column
  pv_signal(:,ocol) = bmag .* exp(j*ph);
  % Acumula la fase para la siguiente trama
  ph = ph + dphi' + dp;
  ocol = ocol+1;
end

% iSTFT +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

% inicializa las variables necesarias
s = size(pv_signal);
cols = s(2);
% w_aux = transform_length;
% Enventanado a la salida
% if rem(w_aux, 2) == 0   % ventana impar
%   w_aux = w_aux + 1;
% end
% halflen = (w_aux-1)/2;
% halff = transform_length/2;
% halfwin = 0.5 * ( 1 + cos( pi * (0:halflen)/halflen));
% win_istft = zeros(1, transform_length);
% acthalflen = min(halff, halflen);
% win_istft((halff+1):(halff+acthalflen)) = halfwin(1:acthalflen);
% win_istft((halff+1):-1:(halff-acthalflen+2)) = halfwin(1:acthalflen);
% Necesario para que se mantenga intacto tras el solapamiento
win_istft = 2/3*win_stft;

% Inicializa las variables necesarias y procede a hacer transformada
% inversa
xlen = transform_length + (cols-1)*hop;
istft_signal = zeros(1,xlen);
for i = 0:hop:(hop*(cols-1))
  ft = pv_signal(:,1+i/hop)';
  ft = [ft, conj(ft([((transform_length/2)):-1:2]))];
  px = real(ifft(ft));
  istft_signal((i+1):(i+transform_length)) = istft_signal((i+1):(i+transform_length))+px.*win_istft;
end

% PREPARACION FINAL +++++++++++++++++++++++++++++++++++++++++++++

% Remuestreo (interpolacion) tras filtrado antialiasing
pre_out = resample(istft_signal,2,1);

% Fuerza a la salida a tener la misma longitud que a la entrada
if length(pre_out) == length(input)
    out = pre_out';
else
    out = zeros(size(input));
    out(1,1:end) = pre_out(1,1:length(input))';
end

end

