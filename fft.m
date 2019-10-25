function plot_pinpu(input_audio )
[y,Fs]=audioread(input_audio);
y=y(:,1);
sigLength=length(y);
Y = fft(y,sigLength);
Pyy = Y.* conj(Y) / sigLength;
halflength=floor(sigLength/2);
f=Fs*(0:halflength)/sigLength;
subplot(2,1,1);plot(f,Pyy(1:halflength+1));xlabel('Frequency(Hz)');
t=(0:sigLength-1)/Fs;
subplot(2,1,2);plot(t,y);xlabel('Time(s)');
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明


end

