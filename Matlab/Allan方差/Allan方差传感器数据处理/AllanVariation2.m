%   �����Ӽ�������ȷ����ѭ��
%   data:��������   data_length��������   subset_data_num���Ӽ�������   subset_sum:�Ӽ����ݺ�
%   i:������   j:��ֵ��������  l:�����ֵ���鰬�׷���  average����ֵ����   allan_variance:���׷�������
%   AllanVariance:�������׷���   subset_num:�Ӽ���
% clc;
clear;
%��ȡ���ݣ���ʼ������������ѹת���ɼ��ٶȣ����ٶ�=��ѹ/�ֱ���*9.8
%150714117�ֱ���=��1.336+0.045��V/g=1.381V/g
%1607072013�ֱ���=��1.163-0.040��V/g=1.123V/g    
data = xlsread('NI9239.xlsx','NI9239','B:B');%��ȡ����
data = data/1.381;  %V->g

data_length = length(data); %��������
allan_variance=zeros(floor(data_length/2),1);%���׷���������
average=zeros(data_length,1);%��ֵ����

%��Allan����
for i=1:floor(data_length/2) %�Ӽ�������
    subset_data_num =  i;
    subset_num=floor(data_length/i);
    average=zeros(data_length,1);
    %�������ֵ
    for j=1:subset_num  %��ֵ��������
        subset_sum=0;
        for k=1:subset_data_num
            subset_sum=subset_sum + data((j-1)*subset_data_num+k);
        end
        average(j)=subset_sum/subset_data_num;
    end
    %�������Allan����
    AllanVariance=0;
    for l=1:(subset_num-1)
        AllanVariance=AllanVariance+(average(l+1)-average(l))^2;
    end
    allan_variance(i,1)=AllanVariance/(2*(subset_num-1));
end
    %��Allan��׼��
for i=1:floor(data_length/2)
    allan_variance(i,1)=sqrt(allan_variance(i,1));
end
%��˫��������ͼ
figure(1)
X=linspace(0.1,floor(data_length/2)*0.1,floor(data_length/2));
plot(X,allan_variance);
%plot(allan_variance)
set(gca,'XScale','log'); 
set(gca,'YScale','log');
xlabel('ƽ��ʱ��(s)');
ylabel('Allan��׼��(g)');
title('Allan����������');
