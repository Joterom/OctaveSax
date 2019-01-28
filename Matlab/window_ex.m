Fs = 48000;
T = 1/Fs;
L = 480;
t = (0:L-1)*T;

freq = 200;

S = sin(2*pi*freq*t);

W = rectwin(L);
W = W';

x = S(1:L);

H = x.*W;

Y_pre = fft(H);

P2 = abs(Y_pre/L);
Y = P2(1:L/2+1);
Y(2:end-1) = 2*Y(2:end-1);


L = 415;
t = (0:L-1)*T;

freq = 200;

S = sin(2*pi*freq*t);

W = rectwin(L);
W = W';

x2 = S(1:L);

H = x2.*W;

Y_pre = fft(H);

P2 = abs(Y_pre/L);
Yb = P2(1:L/2+1);
Yb(2:end-1) = 2*Yb(2:end-1);

hannw = hann(L);
hannw = hannw';

x2 = S(1:L);

H = x2.*hannw;

Y_pre = fft(H);

P2 = abs(Y_pre/L);
Yh = P2(1:L/2+1);
Yh(2:end-1) = 2*Yh(2:end-1);

subplot(3,2,1), stem(x);
subplot(3,2,2), stem(Y);
subplot(3,2,3), stem(x2);
subplot(3,2,4), stem(Yb);
subplot(3,2,5), stem(H);
subplot(3,2,6), stem(Yh);