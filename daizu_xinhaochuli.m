fs=4000;%采样频率
L=400;%采样点数
t=(0:L-1)/fs;%采样点数
y=sin(2*pi*100*t)+sin(2*pi*50*t)+sin(2*pi*230*t);

%画出原信号的频谱图
NFFT = 2^nextpow2(L)
Y = abs(fft(y,NFFT));
f = fs/2*linspace(0,1,NFFT/2+1);
figure;
plot(f,2*abs(Y(1:NFFT/2+1)))
title('信号y（t）的频谱')
xlabel('频率（Hz）')
ylabel('|Y(f)|')

%使用带阻滤波器 y=bands(x,f1,f3,fsl,fsh,rp,rs,Fs)
%f1 ：通带左边界
%f3：通带右边界
%fsl：衰减截止左边界
%fsh：衰减截止右边界
%rp：通带区衰减db设置
%rs：带阻区衰减db设置
%fs：序列x的采样频率
%画出滤波器曲线
%画出处理后的信号曲线
z=bands(y,10,90,40,60,0.1,30,fs);
NFFT = 2^nextpow2(L)
Yz = abs(fft(z,NFFT));
figure;
plot(f,2*abs(Yz(1:NFFT/2+1)))
title('去噪后信号z（t）的频谱')
xlabel('频率（Hz）')
ylabel('|z(f)|')

