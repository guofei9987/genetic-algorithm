%������Ⱥ--ʵ����ʽ
%�ɷɳ�Ʒ%QQ513829987
%Chrom:��Ⱥsize=(pop,lind)
%pop����������
%lind����������
%base��2*lind����,�ֱ��ʾ�Ͻ���½磬ÿ������Ŀ���ȡֵ(2,2,2,2,3,4
%                                                     1,1,1,1,1,0.5)
function Chrom=my_crtrp(pop,lind,base)
if nargin==2
    base_lb=2*ones(1,lind);
    base_ub=zeros(1,lind);
else base_lb=base(1,:);
    base_ub=base(2,:);
end

if size(base_lb,2)~=lind
    error('base����������lind')
end

Chrom=rand(pop,lind).*(ones(pop,1)*base_lb)+ones(pop,1)*base_ub;


end