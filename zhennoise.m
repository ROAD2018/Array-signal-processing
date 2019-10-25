clc 
clear 
close all

thate=0:10:180;
temp=pi/180;
xx1=[1 1.5];
yy1=[2 2.5];
zz1=[1.2 1.2];


for ii=1:2
%      xx=2-1.7*cos(thate(ii)*temp);
%      yy=1.7*sin(thate(ii)*temp)+2.2;
%      zz=1.2;
     %%%%%%%%%%%%%%%%%设置声源位置信息
     xx=xx1(ii);
     yy=yy1(ii);
     zz=zz1(ii);
     
     
     c = 340;                    % Sound velocity (m/s)
     fs = 44100;                 % Sample frequency (samples/s)
     r = [1.0 2.2 1.2 ; 1.4 2.2 1.2 ; 1.8 2.2 1.2;2.2 2.2 1.2 ; 2.6 2.2 1.2 ; 3.0 2.2 1.2];    % Receiver positions [x_1 y_1 z_1 ; x_2 y_2 z_2] (m)
     s = [xx yy zz];              % Source position [x y z] (m)
     L = [4 5 3];                % Room dimensions [x y z] (m)
     beta = 0.2;                 % Reverberation time (s)
     n = 4096;                   % Number of samples
     mtype = 'omnidirectional';  % Type of microphone
     order = -1;                 % -1 equals maximum reflection order!
     dim = 3;                    % Room dimension
     orientation = 0;            % Microphone orientation (rad)
     hp_filter = 1;              % Enable high-pass filter

     h = rir_generator(c, fs, r, s, L, beta, n, mtype, order, dim, orientation, hp_filter);
     %%%%%%%得到每个麦克风阵列的信道函数
     plot(h');
     for jj=2:2
         aa='..\dataping\';
         bb=sprintf('mic_%d.wav',jj);
         a=[aa bb];
         [y,fs]=audioread(a);
         y=10*y;
         for pp=1:6
             h0=h(pp,:);
             Y=conv(y,h0');
             YY=awgn(Y,20);
             audiowrite(sprintf('mic_%d_%d_%d.wav',thate(ii),jj,pp),YY,fs);
         end
     end
end
