function istft_signal = istft(pv_signal, transform_size, hop)
% X = istft(D, F, W, H)                   Inverse short-time Fourier transform.
%	Performs overlap-add resynthesis from the short-time Fourier transform 
%	data in D.  Each column of D is taken as the result of an F-point 
%	fft; each successive frame was offset by H points (default
%	W/2, or F/2 if W==0). Data is hann-windowed at W pts, or 
%       W = 0 gives a rectangular window (default); 
%       W as a vector uses that as window.
%       This version scales the output so the loop gain is 1.0 for
%       either hann-win an-syn with 25% overlap, or hann-win on
%       analysis and rect-win (W=0) on synthesis with 50% overlap.
% dpwe 1994may24.  Uses built-in 'ifft' etc.
% $Header: /home/empire6/dpwe/public_html/resources/matlab/pvoc/RCS/istft.m,v 1.5 2010/08/12 20:39:42 dpwe Exp $

s = size(pv_signal);

cols = s(2);

w_aux = transform_size;


if rem(w_aux, 2) == 0   % force window to be odd-len
  w_aux = w_aux + 1;
end
halflen = (w_aux-1)/2;
halff = transform_size/2;
halfwin = 0.5 * ( 1 + cos( pi * (0:halflen)/halflen));
win_istft = zeros(1, transform_size);
acthalflen = min(halff, halflen);
win_istft((halff+1):(halff+acthalflen)) = halfwin(1:acthalflen);
win_istft((halff+1):-1:(halff-acthalflen+2)) = halfwin(1:acthalflen);
% 2009-01-06: Make stft-istft loop be identity for 25% hop
win_istft = 2/3*win_istft;


w_aux = length(win_istft);
% now can set default hop
if hop == 0 
  hop = floor(w_aux/2);
end

xlen = transform_size + (cols-1)*hop;
istft_signal = zeros(1,xlen);

for i = 0:hop:(hop*(cols-1))
  ft = pv_signal(:,1+i/hop)';
  ft = [ft, conj(ft([((transform_size/2)):-1:2]))];
  px = real(ifft(ft));
  istft_signal((i+1):(i+transform_size)) = istft_signal((i+1):(i+transform_size))+px.*win_istft;
end