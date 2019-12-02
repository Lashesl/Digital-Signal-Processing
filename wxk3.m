function f=wxk3
N=64;
fs=8000;
f=zeros(1,7);
%x=sin(2*pi*350*t) xs是70个采样点的正弦信号
y=abs(fft(x,N));
[m,n]=max(y);
f(1)=(n-1)*fs/N;
snr=[20 15 10 5 0 -5];
for i=1:6
    x=awgn(x,SNR(i));
    y=abs(fft(x,N));
    [m,n]=max(y);
    f(i+1)=(n-1)*fs/N;
end
plot(f);hold;