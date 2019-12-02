function dtc_scut()
disp('���ڼ���ο�ģ��Ĳ���...')
for i =1:10;
    fname = sprinrf('%.wav',i-1);
    x = wavread(fname)';
    [x1 x2] = vad(x);
    m =mfcc(x);
    m = m(x1-2;x2-4,:);
    ref(i).mfcc = m;
end

disp('���ڷ��������ź�...')
for i = 1:10;
    fname = sprintf('%da.wav',i-1);
    [x,fs,bit] = wavread(fname,[2000,2512]);
    %sound(x,fs);
    figure(i);
    subplot(3,3,1);
    plot(x(1:256));
    title('ԭʼ�ź�');
    subplot(3,3,2);
    [h,w] = freqz(x,fs);
    hr = abs(h);
    plot(w,hr);
    title('��Ƶͼ');
    xlabel('Frequency in rad mple')
    ylabel('Magnitude in dB')
    subplot(3,3,3)
    hphase = angle(h);
    hphase = unwrap(hphase);
    plot(w,hphase);
    title('��Ƶͼ');
    xlabel('Frequency in rad mple')
    ylabel('Phase in degrees')
    y = fft(x,512);
    mag = abs(y);
    mag1 = 10*log10(mag);
    f = fs*(0:255)/512;
    subplot(3,3,4)
    plot(f,mag(1:256));
    title('fft�任���ź�');
    iff=ifft(y,512);
    ifm = abs(iff);
    subplot(3,3,5);
    plot(f,ifm(1:256));
    title('ifft���ź�')
    
    Ts = 1/fs;
    N = 512;
    Nw = 20;
    L = Nw/2;
    Tn = (N-Nw)/L+1;
    nfft = 32;
    TF = zeros(Tn,nfft);
    for i =1:Tn
        xw = x((i-1)*10+1:i*10+10);
        temp = fft(xw,nfft);
        temp = fftshift(temp);
        for j =1:nfft;
            TF(i,j) = temp(j);
        end
        subplot(3,3,6)
        fnew = ((1:nfft)-nfft/2)*fs/nfft;
        tnew = (1:Tn)*L*Ts;
        [F,T] = meshgrid(fnew,tnew);
        mesh(F,T,abs(TF))
        title('�ȸ��߱�ʾ')
    end
    
    disp('���ڼ������ģ��Ĳ���...')
    for i=1��10
        fname =sprintf('%db.wav',i-1);
    
    