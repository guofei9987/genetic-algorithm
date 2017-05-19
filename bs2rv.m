%������תʵֵ
%!��Ҫ�Ľ�
%�ɷɳ�ƷQQ513829987
%Chrom �����ƾ��󣬱�ʾһ����Ⱥ
%FieldD=[len;lb;ub;code;scale;lbin;ubin]
%sum(len)=length(Chrom)ÿ���Ӵ��ĳ���
%lbÿ���������½磬ubÿ���������Ͻ�
%code(i)=1  �����Ʊ��룬code(i)=0  ���ױ���
%scale������������scale(i)=1��ʾ�����̶ȣ�scale(i)=0��ʾ�����̶�
%lbin���ֵΪ0��ʾ��Χ��ȥ���½磬Ϊ1��ʾ�����½�
%ubinΪ0��ʾȥ���Ͻ磬Ϊ1��ʾ�����Ͻ�

%
% len = [50,50];%ÿ���Ӵ���һ���Ӵ���Ӧһ���������ĳ���
% lb =[1,2];%ÿ���������½�
% ub = [5,6];%ÿ���������Ͻ�
% code = [0,0];%code(i)=0��ʾ�ø��ױ��룬code(i)=1��ʾ�ö�����
% scale = [0,0];%scale(i)=0�����̶�,scale(i)=1�����̶�
% lin = [1,1];%lin(i)=0��ʾ�����߽磬=1��ʾ���߽�
% uin = [1,1];%ͬ��
% FieldD=[len
%     lb
%     ub
%     code
%     scale
%     lin
%     uin]
%���Phen��ʵ��

function Phen = bs2rv(Chrom,FieldD)

[Nind,~] = size(Chrom);


[~,Nvar] = size(FieldD);


len = FieldD(1,:);%ÿ���Ӵ���һ���Ӵ���Ӧһ���������ĳ���
lb = FieldD(2,:);%ÿ���������½�
ub = FieldD(3,:);%ÿ���������Ͻ�
code = ~(~FieldD(4,:));%code(i)=0��ʾ�ø��ױ��룬code(i)=1��ʾ�ö�����
scale = ~(~FieldD(5,:));%scale(i)=0�����̶�,scale(i)=1�����̶ȣ�ע������̶Ȼ�����Ϊ0
lin = ~(~FieldD(6,:));%lin(i)=0��ʾ�����߽磬=1��ʾ���߽�
uin = ~(~FieldD(7,:));%ͬ��

Phen = zeros(Nind,Nvar);

lf = cumsum(len);
li = cumsum([1 len]);
Prec = .5 .^ len;

logsgn = sign(lb(scale));

%�����̶�2�����̶�
lb(scale) = log( abs(lb(scale)) );
ub(scale) = log( abs(ub(scale)) );
delta = ub - lb;

num = (~lin) .* Prec;
den = (lin + uin - 1) .* Prec;

for i = 1:Nvar,
    idx = li(i):lf(i);
    if code(i) % Gray decoding
        Chrom(:,idx)=rem(cumsum(Chrom(:,idx)')',2);
    end
    Phen(:,i) = Chrom(:,idx) * [ (.5).^(1:len(i))' ];
    Phen(:,i) = lb(i) + delta(i) * (Phen(:,i) + num(i)) ./ (1 - den(i));
end

expand = ones(Nind,1);
if any(scale)
    Phen(:,scale) = logsgn(expand,:) .* exp(Phen(:,scale));
end
end
