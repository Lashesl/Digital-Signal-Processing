fs=4000;%����Ƶ��
L=400;%��������
t=(0:L-1)/fs;%��������
y=sin(2*pi*100*t)+sin(2*pi*50*t)+sin(2*pi*230*t);

%����ԭ�źŵ�Ƶ��ͼ
NFFT = 2^nextpow2(L)
Y = abs(fft(y,NFFT));
f = fs/2*linspace(0,1,NFFT/2+1);
figure;
plot(f,2*abs(Y(1:NFFT/2+1)))
title('�ź�y��t����Ƶ��')
xlabel('Ƶ�ʣ�Hz��')
ylabel('|Y(f)|')

%ʹ�ô����˲��� y=bands(x,f1,f3,fsl,fsh,rp,rs,Fs)
%f1 ��ͨ����߽�
%f3��ͨ���ұ߽�
%fsl��˥����ֹ��߽�
%fsh��˥����ֹ�ұ߽�
%rp��ͨ����˥��db����
%rs��������˥��db����
%fs������x�Ĳ���Ƶ��
%�����˲�������
%�����������ź�����
z=bands(y,10,90,40,60,0.1,30,fs);
NFFT = 2^nextpow2(L)
Yz = abs(fft(z,NFFT));
figure;
plot(f,2*abs(Yz(1:NFFT/2+1)))
title('ȥ����ź�z��t����Ƶ��')
xlabel('Ƶ�ʣ�Hz��')
ylabel('|z(f)|')

