clc
clear
c=340;
D=[];
d=0.4;

a1=1.0;
b1=2.2;
c1=1.2;           %第一个麦克风阵列的位置

ac=2.0;
bc=2.2;
cc=1.2;

stra='C:\Users\luoshu\Desktop\Audio Analysis Lab original code\Audio Analysis Lab original code\rirGen\dataping\mic_2.wav';
[x1,fs]=audioread(stra);

strb0='C:\Users\luoshu\Desktop\Audio Analysis Lab original code\Audio Analysis Lab original code\rirGen\';
for ii=0:10:10
    for pp=1:6
         strb1=sprintf('mic_%d_2_%d.wav',ii,pp);
         strb=[strb0 strb1];
         [x2,fs]=audioread(strb);

          Ncorr = length(x1)-1;   % 线性互相关长度
          NFFT = 2^(nextpow2(Ncorr)-1); % 计算FFT点数

          % 计算GCC-PAHT
          X1=fft(x1, NFFT);
          X2=fft(x2, NFFT);
          P= X1.*conj(X2);                 % 计算互功率谱
          A = 1./abs(P);
          R_est1 = fftshift(ifft(A.*P));
          %plot(R_est1);
          [~,tau] = max(R_est1); %寻找相关最大的点
           tau =abs( tau - 0.5*NFFT -2 );
           D(pp) = c*tau*(1/fs);
    end

    
   a0(1)=( 2*a1+5*d-(D(6)^2-D(1)^2)/(5*d) )/2;
   b0(1)=b1+abs(sqrt(D(1)^2-(a0(1)-a1)^2)); 
    
%     
%    a0(2)=( 2*a1+2*d-(D(5)^2-D(2)^2)/(2*d) )/2;
%    b0(2)=b1+sqrt(D(2)^2-(a0(2)-a1-d)^2); 
%    
%    a0(3)=( 2*a1+d-(D(4)^2-D(3)^2)/d )/2;
%    b0(3)=b1+sqrt(D(3)^2-(a0(3)-a1-2*d)^2); 
%     
%    A0=mean(a0);
%    B0=mean(b0);
   
   X=(a0-ac)^2;
   Y=(b0-bc)^2;
   s=sqrt(X+Y);
   
   th((ii)/10+1)=acos((ac-a0)/s)*180/pi;
   at((ii)/10+1)=0;
   
   
   
   figure(ii/10+1);
   
   
   theta=0:2*pi/3600:2*pi;
   
   a1=1.0;
   b1=2.2;
   r1=D(1);           %第一个麦克风阵列的位置
   Circle1=a1+r1*cos(theta);
   Circle2=b1+r1*sin(theta);
   
   a2=1.4;
   b2=2.2;
   r2=D(2);           %第2个麦克风阵列的位置
   Circle3=a2+r2*cos(theta);
   Circle4=b2+r2*sin(theta);
   
   a3=1.8;
   b3=2.2;
   r3=D(3);           %第3个麦克风阵列的位置
   Circle5=a3+r3*cos(theta);
   Circle6=b3+r3*sin(theta);
   
   a4=2.2;
   b4=2.2;
   r4=D(4);           %第4个麦克风阵列的位置
   Circle7=a4+r4*cos(theta);
   Circle8=b4+r4*sin(theta);
   
   a5=2.6;
   b5=2.2;
   r5=D(5);           %第5个麦克风阵列的位置
   Circle9=a5+r5*cos(theta);
   Circle10=b5+r5*sin(theta);  
   
   a6=3.0;
   b6=2.2;
   r6=D(6);           %第6个麦克风阵列的位置
   Circle11=a6+r6*cos(theta);
   Circle12=b6+r6*sin(theta);
   
   plot(Circle1,Circle2,'r','Linewidth',1);
   hold on
   plot(Circle3,Circle4,'b','Linewidth',1);
   plot(Circle5,Circle6,'g','Linewidth',1);
   plot(Circle7,Circle8,'k','Linewidth',1);
   plot(Circle9,Circle10,'b','Linewidth',1);
   plot(Circle11,Circle12,'b','Linewidth',1);
   
   
   hold off
   
end













