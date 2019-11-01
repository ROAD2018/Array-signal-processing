clc
clear
close all;

fs=44100;
t=0.02;          %每帧数据长度，20ms
mu=fs*0.01;      %迭代步长
T=fs*t;          %汉明窗长度
ch=hamming(T);   %选取汉明窗作为数据分帧的加窗函数

fcfs = flipud(MakeERBFilters(22050,50,50));
gtir = ERBFilterBank([1, zeros(1,1000)],fcfs);
H = zeros(50,882);
for i = 1:50; H(i,:) = freqz(gtir(i,:),1,882); end

thate=0:5:180;
for ii=1:1
   for jj=1:1
       for pp=1:1
           file_name=sprintf('mic_%d_%d_%d.wav',thate(ii),jj,pp);
           [x1,fs]=audioread(file_name);
           X1=x1(1.5*fs:2.5*fs);
           for mm=50:50
               yt=X1((mm-1)*mu+1:(mm-1)*mu+T);                
               yt1 = yt.*ch;
               for gg=1:50
                   sigLength=length(yt1);
                   Y = fft(yt1,sigLength);
                   Y=H(gg,:).*Y';
                   Pyy = Y.* conj(Y) / sigLength;
                   phyy= angle(Y)*180/pi;
                   halflength=floor(sigLength/2);
                   f=fs*(0:halflength)/sigLength;
                   figure(gg);
                   subplot(2,1,1);plot(f,Pyy(1:halflength+1));xlabel('Frequency(Hz)');
                   t=(0:sigLength-1)/fs;
                   subplot(2,1,2);plot(f,phyy(1:halflength+1));xlabel('Frequency(Hz)');     
               end
           end 
       end
   end      
end


       
   