%������Ⱥ-��ɢ��ʽ
%�ɷɳ�ƷQQ513829987
%Chrom:��Ⱥsize=(pop,lind)
%pop����������
%lind����������
%base��1*lind����ÿ������Ŀ���ȡֵ(2,2,2,2,3,4)
function Chrom=my_crtbp(pop,lind,base)
if nargin==2
    base=2*ones(1,lind);
end

if size(base,2)~=lind
    error('base����������lind')
end

Chrom=floor(rand(pop,lind).*(ones(pop,1)*base));

end