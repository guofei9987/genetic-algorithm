%������������
clear;clc;
%%
%�������ľ���
a=0%������
b=10%������
k=4%����

con=0;lind=0;
while con==0
    if 2^lind>(b-a)*10^k
        con=1;
    else lind=lind+1;
    end
end
lind

%lind��Ⱦɫ�峤��


%%

pop=40
lind=50;

BaseV=2*ones(1,lind);
Chrom=my_crtbp(pop,lind,BaseV);

len = [25,25];%ÿ���Ӵ���һ���Ӵ���Ӧһ���������ĳ���
lb =[-2,-2];%ÿ���������½�
ub = [2,2];%ÿ���������Ͻ�
code = [0,0];%code(i)=0��ʾ�ø��ױ��룬code(i)=1��ʾ�ö�����
scale = [0,0];%scale(i)=0�����̶�,scale(i)=1�����̶�
lin = [1,1];%lin(i)=0��ʾ�����߽磬=1��ʾ���߽�
uin = [1,1];%ͬ��
FieldD=[len
    lb
    ub
    code
    scale
    lin
    uin];

for i=1:200
Phen=bs2rv(Chrom,FieldD);

fitnessY=myfun(Phen(:,1),Phen(:,2));

g=ranking(fitnessY);
%scaling

NewChrIx=rws(g,pop);%�¸��������ֵ
Chrom=Chrom(NewChrIx,:);%�¸���
%reins

Chrom=xovmp(Chrom,0.8,1);%����

Chrom=mut(Chrom,0.01,BaseV);
end

%������
Phen=bs2rv(Chrom,FieldD);
fitnessY=myfun(Phen(:,1),Phen(:,2));
[fitnessY_bset,ind]=min(fitnessY);
Phen(ind,:)