%%%由于加噪函数，加噪后的语音还是存储到原音频文件目录下，因此一个文件夹下的音频建议只用一次；
%%%对于生成多种信噪比的语音，建议将音频文件复制多份，每份将代码考入，更改信噪比运行


clc;
clear;
close all;

thate=0:10:180;
for ii=1:1
    for jj=1:1
        for pp=1:6
            a0='C:\Users\luoshu\Desktop\Audio Analysis Lab original code\Audio Analysis Lab original code\rirGen\data\';
            b0=sprintf('mic_%d_%d_%d.wav',thate(ii),jj,pp);
            c0=[a0 b0];
            [y,fs]=audioread(c0);
            Y=awgn(y,30);               %其中30为信噪比,可以改为0,10,20等
            a1='C:\Users\luoshu\Desktop\Audio Analysis Lab original code\Audio Analysis Lab original code\rirGen\data\data0\';
            b1=sprintf('mic_%d_%d_%d.wav',thate(ii),jj,pp);
            c1=[a1 b1];
            audiowrite(c1,Y,fs);
        end   
    end 
end
