function findfreqz(snr)

Fs=8000;
T=1/Fs;
L=70;
x=(0:L-1)*T;
y1 = sin (2*pi*350*x);
NFFT=100;% NFFT = 2^nextpow2(L)
Y = abs(fft(y1,NFFT));
[m,n]=max(Y);
f(1)=(n-1)*Fs/NFFT
%�ò�����8000Hz����Ƶ��Ϊ350Hz�ĵ�Ƶ�����źŽ��в�����
%ȡ70������Ϊԭʼ�źţ�������)
    %a=0;b=0.5; %��ֵ��0 ����Ϊb^2
%figure(1)
%plot(x,y1);
%axis([0,0.1,-2,2]);
%title('δ�ܸ���ʱ�źŵĲ���');
%ylabel('y');
%xlabel('x/20pi');
%grid;
snr=[20 15 10 5 0 -5];
for(i=1:6) %snrѭ��
for(j=1:1:100) %�������ѭ��
y2 = awgn(y1,snr(i));%���������źţ��������10
 %y = y1+y2;% �����˹������֮����ź�
% figure(2);
% plot(x,y);
% axis([0,0.1,-3,3]);
% title('�����˸�˹���������źŲ���');
% ylabel('y');
% xlabel('x/20pi');
% grid;
y=abs(fft(y2,NFFT));
[m,n]=max(y);
f(i+1)=(n-1)*Fs/N;

f = Fs/2*linspace(0,1,NFFT/2+1);

figure(3);
plot(f,2*abs(Y(1:NFFT/2+1)))

title('�ź�y��t����Ƶ��')
xlabel('Ƶ�ʣ�Hz��')
ylabel('|Y(f)|')

fmax = 2*abs(Y(1));
mn(j)=0;
for(i=1:1:NFFT/2+1)
    if(2*abs(Y(i))>fmax)
        fmax=2*abs(Y(i)); %�ҵ���ֵ����
        mn(j)=i; %��ֵ���ʱ ��ӦƵ��
    end
end%�ҵ������Ƶ��ֵ
end
end

%sqrt(sum((x-350).^2)/100);
stem(mn)