function out = algoritmo_final( x )
%ALGORITMO_FINAL Summary of this function goes here
%   Detailed explanation goes here

r = 2;
n = 1024;

% With hann windowing on both input and output, 
% we need 25% window overlap for smooth reconstruction
hop = n/4;
% Effect of hanns at both ends is a cumulated cos^2 window (for
% r = 1 anyway); need to scale magnitudes by 2/3 for
% identity input/output
%scf = 2/3;
% 2011-02-07: this factor is now included in istft.m
scf = 1.0;



% Calculate the basic STFT, magnitude scaled
h = 0;

% expect x as a row
if size(x,1) > 1
  x = x';
end

s = length(x);

if length(n) == 1
  if n == 0
    % special case: rectangular window
    win = ones(1,n);
  else
    if rem(n, 2) == 0   % force window to be odd-len
      n = n + 1;
    end
    halflen = (n-1)/2;
    halff = n/2;   % midpoint of win
    halfwin = 0.5 * ( 1 + cos( pi * (0:halflen)/halflen));
    win = zeros(1, n);
    acthalflen = min(halff, halflen);
    win((halff+1):(halff+acthalflen)) = halfwin(1:acthalflen);
    win((halff+1):-1:(halff-acthalflen+2)) = halfwin(1:acthalflen);
  end
else
  win = n;
end

n = length(win);
% now can set default hop
if h == 0
  h = floor(n/2);
end

c = 1;

% pre-allocate output array
d = zeros((1+n/2),1+fix((s-n)/h));

for b = 0:h:(s-n)
  u = win.*x((b+1):(b+n));
  t = fft(u);
  d(:,c) = t(1:(1+n/2))';
  c = c+1;
end;

stft_signal = d;

% +++++++++++

% Calculate the new timebase samples
[rows, cols] = size(X);
t = 0:r:(cols-2);
% Have to stay two cols off end because (a) counting from zero, and 
% (b) need col n AND col n+1 to interpolate

% Generate the new spectrogram
[rowspv,colspv] = size(stft_signal);

N = 2*(rowspv-1);

if hop == 0
  % default value
  hop = N/2;
end

% Empty output array
out_pv = zeros(rowspv, length(t));

% Expected phase advance in each bin
dphi = zeros(1,N/2+1);
dphi(2:(1 + N/2)) = (2*pi*hop)./(N./(1:(N/2)));

% Phase accumulator
% Preset to phase of first frame for perfect reconstruction
% in case of 1:1 time scaling
ph = angle(stft_signal(:,1));

% Append a 'safety' column on to the end of b to avoid problems 
% taking *exactly* the last frame (i.e. 1*b(:,cols)+0*b(:,cols+1))
stft_signal = [stft_signal,zeros(rowspv,1)];

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

% +++++++++++++++++++++++++++++++++++++
% Invert to a waveform

s = size(out_pv);
if s(1) ~= (n/2)+1
  error('number of rows should be fftsize/2+1')
end
cols = s(2);
 
if length(n) == 1
  if n == 0
    % special case: rectangular window
    win = ones(1,n);
  else
    if rem(n, 2) == 0   % force window to be odd-len
      n = n + 1;
    end
    halflen = (n-1)/2;
    halff = n/2;
    halfwin = 0.5 * ( 1 + cos( pi * (0:halflen)/halflen));
    win = zeros(1, n);
    acthalflen = min(halff, halflen);
    win((halff+1):(halff+acthalflen)) = halfwin(1:acthalflen);
    win((halff+1):-1:(halff-acthalflen+2)) = halfwin(1:acthalflen);
    % 2009-01-06: Make stft-istft loop be identity for 25% hop
    win = 2/3*win;
  end
else
  win = n;
end

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
end;

out = resample(out_istft,2,1);

end

