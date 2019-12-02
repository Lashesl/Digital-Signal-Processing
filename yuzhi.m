function yuzhi()
A = imread('ball.jpg');
I = double(rgb2gray(A));
figure(1);
imshow(uint8(I));
title('原图');

g = zeros(8,8);
[m,n] = size(g);
a = 0;
for i = 1:m
    for j =1:m;
        if i ==1
            a = sqrt(1/m);
        else
            a =sqrt(2/m);
        end
        q = ((2*(j-1)+1)*(i-1)*pi)/(2*m);
        g(i,j) = a*cos(q);
    end
end

I1 = blkproc(I,[8 8],'P1*x*P2',g,g');
figure(2);
imshow(uint8(I1));
title('DCT变换');

a = ones(8,8);
b = reshape(g,1,64);
c = median(b);
for i=1:8;
    for j = 1:8;
        if(abs(g(i,j))<c)
            a(i,j) = 0;
        end;
    end;
end;
I2 = blkproc(I1,[8 8],'P1.*x',a);
figure(3);
imshow(uint8(I2));
title('对DCT区域编码');

I3 = blkproc(I2,[8 8],'P1*x*P2',g,g');
figure(4);
imshow(uint8(I3));
title('对DCT区域编码后反DCT变换');
        