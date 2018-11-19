function stft_signal = stft(input, transform_size, hop)
% D = stft(X, F, W, H, SR)                       Short-time Fourier transform.
%	Returns some frames of short-term Fourier transform of x.  Each 
%	column of the result is one F-point fft (default 256); each
%	successive frame is offset by H points (W/2) until X is exhausted.  
%       Data is hann-windowed at W pts (F), or rectangular if W=0, or 
%       with W if it is a vector.
%       Without output arguments, will plot like sgram (SR will get
%       axes right, defaults to 8000).
%	See also 'istft.m'.
% dpwe 1994may05.  Uses built-in 'fft'
% $Header: /home/empire6/dpwe/public_html/resources/matlab/pvoc/RCS/stft.m,v 1.4 2010/08/13 16:03:14 dpwe Exp $

% expect x as a row
if size(input,1) > 1
  input = input';
end

s = length(input);
w1 = transform_size;

if rem(w1, 2) == 0   % force window to be odd-len
  w1 = w1 + 1;
end
halflen = (w1-1)/2;
halff = transform_size/2;   % midpoint of win
halfwin = 0.5 * ( 1 + cos( pi * (0:halflen)/halflen));
win_stft = zeros(1, transform_size);
acthalflen = min(halff, halflen);
win_stft((halff+1):(halff+acthalflen)) = halfwin(1:acthalflen);
win_stft((halff+1):-1:(halff-acthalflen+2)) = halfwin(1:acthalflen);

c_stft = 1;

% pre-allocate output array
out = zeros((1+transform_size/2),1+fix((s-transform_size)/hop));

for i = 0:hop:(s-transform_size)
  frame = win_stft.*input((i+1):(i+transform_size));
  tot = fft(frame);
  out(:,c_stft) = tot(1:(1+transform_size/2))';
  c_stft = c_stft+1;
end;

stft_signal = out;

end