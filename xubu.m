function xubu(z)
n = 0:50;
z=j*pi/6;
x = exp(z*n);
subplot(1,2,1)
stem(n,real(x));xlabel('n');
ylabel('实部');title('复指数j*pi/6的实部');
subplot(1,2,2)
stem(n,imag(x));
xlabel('n');
ylabel('虚部')
title('复指数j*pi/6的虚部');