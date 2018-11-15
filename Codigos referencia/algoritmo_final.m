function out = algoritmo_final( x )
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
transform_length = 256;
hop = transform_length/4;

% STFT +++++++++++++++++++++++++++++++++++++++++++++++
if size(x,1) > 1
  x = x';
end

n = transform_length; % Se sobreescribe mas adelante
s = length(x);

if length(n) == 1
    if rem(n, 2) == 0   % force window to be odd-len
      n = n + 1;
    end
    halflen = (n-1)/2;
    halff = transform_length/2;   % midpoint of win
    halfwin = 0.5 * ( 1 + cos( pi * (0:halflen)/halflen));
    win = zeros(1, transform_length);
    acthalflen = min(halff, halflen);
    win((halff+1):(halff+acthalflen)) = halfwin(1:acthalflen);
    win((halff+1):-1:(halff-acthalflen+2)) = halfwin(1:acthalflen);
end

n = length(win);
h = floor(n/2);
c = 1;

% pre-allocate output array
d = zeros( (1 + transform_length/2 ), 1 + fix( (s - transform_length) / h) );

for b = 0:h:(s-transform_length)
  u = win.*x((b+1):(b+transform_length));
  nc = fft(u);
  d(:,c) = nc(1:(1+transform_length/2))';
  c = c+1;
end

stft_signal = d;

% PVSAMPLE +++++++++++++++++++++++++++++++++++++++++++++++++

[rows, cols] = size(stft_signal);
t = 0:r:(cols-2);
% Have to stay two cols off end because (a) counting from zero, and 
% (b) need col n AND col n+1 to interpolate

N = 2*(rows-1);

% Empty output array
out_pv = zeros(rows, length(t));

% Expected phase advance in each bin
dphi = zeros(1,N/2+1);
dphi(2:(1 + N/2)) = (2*pi*hop)./(N./(1:(N/2)));

% Phase accumulator
% Preset to phase of first frame for perfect reconstruction
% in case of 1:1 time scaling
ph = angle(stft_signal(:,1));

% Append a 'safety' column on to the end of b to avoid problems 
% taking *exactly* the last frame (i.e. 1*b(:,cols)+0*b(:,cols+1))
stft_signal = [stft_signal,zeros(rows,1)];

ocol = 1;
for tt = t
  % Grab the two columns of b
  bcols = stft_signal(:,floor(tt)+[1 2]);
  tf = tt - floor(tt);
  bmag = (1-tf)*abs(bcols(:,1)) + tf*(abs(bcols(:,2)));
  % calculate phase advance
  dp = angle(bcols(:,2)) - angle(bcols(:,1)) - dphi';
  % Reduce to -pi:pi range
  dp = dp - 2 * pi * round(dp/(2*pi));
  % Save the column
  out_pv(:,ocol) = bmag .* exp(j*ph);
  % Cumulate phase, ready for next frame
  ph = ph + dphi' + dp;
  ocol = ocol+1;
end

% iSTFT +++++++++++++++++++++++++++++++++++++++++++++++++++++++++

s = size(out_pv);
if s(1) ~= (transform_length/2)+1
  error('number of rows should be fftsize/2+1')
end
cols = s(2);
 
if rem(n, 2) == 0   % force window to be odd-len
  n = n + 1;
end
halflen = (n-1)/2;
halff = n/2;
halfwin = 0.5 * ( 1 + cos( pi * (0:halflen) / halflen) );
win = zeros(1, n);
acthalflen = min(halff, halflen);
win( (halff + 1):(halff + acthalflen)) = halfwin(1:acthalflen);
win( (halff + 1):-1:(halff - acthalflen + 2)) = halfwin(1:acthalflen);
% 2009-01-06: Make stft-istft loop be identity for 25% hop
win = 2/3*win;


n = length(win);
% now can set default hop
if h == 0 
  h = floor(n/2);
end

xlen = n + (cols-1)*h;
out_istft = zeros(1,xlen);

for b = 0:h:(h*(cols-1))
  ft = out_pv(:,1+b/h)';
  ft = [ft, conj(ft([((n/2)):-1:2]))];
  px = real(ifft(ft));
  out_istft((b+1):(b+n)) = out_istft((b+1):(b+n))+px.*win;
end

out = resample(out_istft,2,1);

end

