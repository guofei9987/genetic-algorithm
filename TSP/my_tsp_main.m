%%
%��������
clear
clc
close all
num_city=18
citycoor=random('unif',0,1,num_city,2);%���ɳ�������
citydist=squareform(pdist(citycoor));%����������



%%
%�㷨ʵ��
pop_size=300;%��Ⱥ
lind=num_city;%���򳤶�

[~,Chrom]=sort(random('unif',0,1,pop_size,lind),2);


for i=1:500
    
    fitnessY=my_tsp_fitness(Chrom,citycoor,citydist);

    g=ranking(fitnessY);
    %scaling
    
    NewChrIx=rws(g,pop_size);%�¸��������ֵ
    Chrom=Chrom(NewChrIx,:);%�¸���
    %reins
    for j=1:2:pop_size-1
        if rand<0.4
            cc=random('unid',lind,1,2);
            c1=cc(1);
            c2=cc(2);
            [Chrom(j,:),Chrom(j+1,:)]=my_tsp_crossover(Chrom(j,:),Chrom(j+1,:),c1,c2);
        end
    end
    %Chrom=xovmp(Chrom,0.8,1);%����
    
    for j=1:pop_size
        if rand<0.2
            cc=random('unid',lind,1,2);
            c1=cc(1);
            c2=cc(2);
            Chrom(j,:)=my_tsp_mut(Chrom(j,:),c1,c2);
        end
    end
    %����
    
    
    
    
    
end
fitnessY=my_tsp_fitness(Chrom,citycoor,citydist);
[fitnessY_bset,ind]=min(fitnessY);
x=Chrom(ind,:)

figure 

plot(citycoor(:,1),citycoor(:,2),'o')
hold on
plot(citycoor([x,x(1)],1),citycoor([x,x(1)],2),'-')
axis([0,1,0,1])