function xubu(z)
n = 0:50;
z=j*pi/6;
x = exp(z*n);
subplot(1,2,1)
stem(n,real(x));xlabel('n');
ylabel('ʵ��');title('��ָ��j*pi/6��ʵ��');
subplot(1,2,2)
stem(n,imag(x));
xlabel('n');
ylabel('�鲿')
title('��ָ��j*pi/6���鲿');