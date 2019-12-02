function y=bands(x,f1,f3,fsl,fsh,rp,rs,Fs)
%带阻滤波器
%通带或阻带的截止频率与采样率的选取范围是不能超过采样率的一半
%f1 f3 fsl fsh 的值小于fs/2
%x：需要带阻滤波的序列
%f1 ：通带左边界
%f3：通带右边界
%fsl：衰减截止左边界
%fsh：衰减截止右边界
%rp：通带区衰减db设置
%rs：带阻区衰减db设置
%fs：序列x的采样频率
wp1=2*pi*f1/Fs;
wp3=2*pi*f3/Fs;
wsl=2*pi*fsl/Fs;
wsh=2*pi*fsh/Fs;
wp=[wp1 wp3];%带通区域
ws=[wsl wsh];%带阻区域
[n,wn]=cheb1ord(ws/pi,wp/pi,rp,rs); %利用cheblord函数求滤波器的最小阶数
[bz1,az1]=cheby1(n,rp,wp/pi,'stop'); %计算切比雪夫I型模拟低通滤波器系统函数系数
%看滤波器曲线--------------
[h,w]=freqz(bz1,az1,256,Fs); %求滤波器的幅值 h 频率w 频率响应函数值
h=20*log(abs(h));
figure(2);
plot(w,h);title('设计滤波器的通带曲线');
y=filter(bz1,az1,x);%对原信号进行滤波
end
