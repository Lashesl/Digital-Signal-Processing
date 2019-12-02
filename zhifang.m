function quzao()
x=imread('ball.jpg');
x=rgb2gray(x);
[M,N]=size(x);
noi=40.*randn(M,N);
xx=double(x)+noi;
PI=[1 2 1;2 4 2;1 2 1]/16;
PI=double(PI);
xx=double(xx);
y=conv2(PI,xx);
figure; subplot(2,1,1);imshow(uint8(xx));title('º”‘Î');
subplot(2,1,2);imshow(uint8(y));title('»•‘Î');