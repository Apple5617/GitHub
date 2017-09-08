%�������
% clc;
clear;
%��ȡ����
h1 = openfig('150714117.fig','reuse'); % open figure  
D1=get(gca,'Children'); %get the handle of the line object  
XData1=get(D1,'XData'); %get the x data  
YData1=get(D1,'YData'); %get the y data 
LogXdata1 = log10(XData1);
LogYdata1 = log10(YData1);
LogXdata2 = LogXdata1(13230:29460);
LogYdata2 = LogYdata1(13230:29460);
%ͼ��˵��
%title('\alpha_{0}^{2}+\beta_{0}^{2}=1')
axis([10^(-1) 10^5 10^(-7) 10^(-1)]);
% xlabel('ƽ��ʱ��(s)');
% ylabel('���ױ�׼��(m/s^2)');
title('150714117Allan����������');
hold on;
%б��Ϊ-1ֱ��
x1 = linspace(XData1(1),XData1(end));
y1 = (10^(-4.676))*(x1.^(-1));
%y1 = log10(-1*10.^(x1)-4.788);
plot(x1,y1,'k--');
%б��Ϊ-1/2ֱ��
x1 = linspace(XData1(1),XData1(end));
y1 = (10^(-4.463))*(x1.^(-0.5));
%y1 = log10(-1*10.^(x1)-4.788);
plot(x1,y1,'k--');
%б��Ϊ0ֱ��
line([10^(-1),10^(5)],[10^(-5.011),10^(-5.011)],'color','k','linestyle','--');
%б��Ϊ1/2ֱ��
x1 = linspace(XData1(1),XData1(end));
y1 = (10^(-5.64))*(x1.^(0.5));
%y1 = log10(-1*10.^(x1)-4.788);
plot(x1,y1,'k--');
%б��Ϊ1ֱ��
x1 = linspace(XData1(1),XData1(end));
y1 = (10^(-7.141))*(x1);
%y1 = log10(-1*10.^(x1)-4.788);
plot(x1,y1,'k--');
%������
Q = (10^(-4.676))*(sqrt(3).^(-1));
R = (10^(-4.463))*(1.^(-0.5));
B = 10^(-5.011)*0.6648;
K = (10^(-5.64))*(3.^(0.5));
T = (10^(-7.141))*(sqrt(2));
%�����ʾ
text(10^(0),10^(-2.5),['quantization noise=',num2str(Q),' g��s']);
text(10^(0),10^(-2.8),['velocity random walk=',num2str(R),' g��s^1^/^2']);
text(10^(0),10^(-3.1),['bias instability=',num2str(B),' g']);
text(10^(0),10^(-3.4),['acceleration random walk=',num2str(K),' g��s^-^1^/^2']);
text(10^(0),10^(-3.7),['acceleration trend=',num2str(T),' g��s^-^1']);
text(10^(3),10^(-3),['������=',num2str(1.381),'V/g']);



