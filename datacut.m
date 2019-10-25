clc
clear
%从文件中读取数据
%首先获得指定文件夹下的所有文件的文件名
directory = uigetdir('F:\matlab2016\bin\AISHELL-2019C-EVAL','ACE600');
dirs=dir(directory);%dirs结构体类型,不仅包括文件名，还包含文件其他信息。
dircell=struct2cell(dirs)'; %类型转化，转化为元组类型
filenames=dircell(:,1) ;%文件类型存放在第一列
%然后根据后缀名筛选出指定类型文件并读入
[n m] = size(filenames);%获得大小
n1=n/3;
img0=[];
img1=[];
img2=[];
for i = 1:n1-1
         if ~isempty( strfind(filenames{3*i}, '.wav') )%筛选出wav文件
             filename = filenames{3*i};
             filepath = fullfile(directory,filename);
             [img0,f0] = audioread(filepath);%读取语音
         end
         if ~isempty( strfind(filenames{3*i+1}, '.wav') )%筛选出wav文件
             filename = filenames{3*i+1};
             filepath = fullfile(directory,filename);
             [img1,f1] = audioread(filepath);%读取语音
         end
         if ~isempty( strfind(filenames{3*i+2}, '.wav') )%筛选出wav文件
             filename = filenames{3*i+2};
             filepath = fullfile(directory,filename);
             [img2,f2] = audioread(filepath);%读取语音
         end
         str=[img0 
             img1 
             img2];
         str=str(1:44100*6);
         audiowrite(sprintf('mic_%d.wav',i+99),str,f0);                    
end
