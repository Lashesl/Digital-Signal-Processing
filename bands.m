function y=bands(x,f1,f3,fsl,fsh,rp,rs,Fs)
%�����˲���
%ͨ��������Ľ�ֹƵ��������ʵ�ѡȡ��Χ�ǲ��ܳ��������ʵ�һ��
%f1 f3 fsl fsh ��ֵС��fs/2
%x����Ҫ�����˲�������
%f1 ��ͨ����߽�
%f3��ͨ���ұ߽�
%fsl��˥����ֹ��߽�
%fsh��˥����ֹ�ұ߽�
%rp��ͨ����˥��db����
%rs��������˥��db����
%fs������x�Ĳ���Ƶ��
wp1=2*pi*f1/Fs;
wp3=2*pi*f3/Fs;
wsl=2*pi*fsl/Fs;
wsh=2*pi*fsh/Fs;
wp=[wp1 wp3];%��ͨ����
ws=[wsl wsh];%��������
[n,wn]=cheb1ord(ws/pi,wp/pi,rp,rs); %����cheblord�������˲�������С����
[bz1,az1]=cheby1(n,rp,wp/pi,'stop'); %�����б�ѩ��I��ģ���ͨ�˲���ϵͳ����ϵ��
%���˲�������--------------
[h,w]=freqz(bz1,az1,256,Fs); %���˲����ķ�ֵ h Ƶ��w Ƶ����Ӧ����ֵ
h=20*log(abs(h));
figure(2);
plot(w,h);title('����˲�����ͨ������');
y=filter(bz1,az1,x);%��ԭ�źŽ����˲�
end
