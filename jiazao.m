%%%���ڼ��뺯�����������������Ǵ洢��ԭ��Ƶ�ļ�Ŀ¼�£����һ���ļ����µ���Ƶ����ֻ��һ�Σ�
%%%�������ɶ�������ȵ����������齫��Ƶ�ļ����ƶ�ݣ�ÿ�ݽ����뿼�룬�������������


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
            Y=awgn(y,30);               %����30Ϊ�����,���Ը�Ϊ0,10,20��
            a1='C:\Users\luoshu\Desktop\Audio Analysis Lab original code\Audio Analysis Lab original code\rirGen\data\data0\';
            b1=sprintf('mic_%d_%d_%d.wav',thate(ii),jj,pp);
            c1=[a1 b1];
            audiowrite(c1,Y,fs);
        end   
    end 
end
