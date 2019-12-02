function findfreqz()
for(j=1:1:100)
Fs=8000;
T=1/Fs;
L=70;
x=(0:L-1)*T;
y1 = sin (2*pi*350*x);
%用采样率8000Hz，对频率为350Hz的单频正弦信号进行采样，
%取70个点作为原始信号（无噪声)
    %a=0;b=0.5; %均值是0 房差为b^2
%figure(1)
%plot(x,y1);
%axis([0,0.1,-2,2]);
%title('未受干扰时信号的波形');
%ylabel('y');
%xlabel('x/20pi');
%grid;

%y2 = awgn(y1,snr);%混入噪声信号，信噪比是10
 %y = y1+y2;% 加入高斯白噪声之后的信号
% figure(2);
% plot(x,y);
% axis([0,0.1,-3,3]);
% title('叠加了高斯白噪声的信号波形');
% ylabel('y');
% xlabel('x/20pi');
% grid;

NFFT=100;% NFFT = 2^nextpow2(L)
Y = abs(fft(y1,NFFT));
f = Fs/2*linspace(0,1,NFFT/2+1);

figure(3);
plot(f,2*abs(Y(1:NFFT/2+1)))

title('信号y（t）的频谱')
xlabel('频率（Hz）')
ylabel('|Y(f)|')
[m,n]=max(Y)
f(1)=(n-1)*Fs/NFFT
% fmax = 2*abs(Y(1));
% mn(j)=0;
% for(i=1:1:NFFT/2+1)
%     if(2*abs(Y(i))>fmax)
%         fmax=2*abs(Y(i)); %找到幅值最大的
%         mn(j)=i; %幅值最大时 对应频率
%     end
end%找到了最大频率值
end

%sqrt(sum((x-350).^2)/100);
