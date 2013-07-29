function [ fipNet] = genNetFip(g,nArr)
nf=4;
fltr1=nthIndFltr(g,nf,1,1);
fltr2=nthIndFltr(g,1,nf,1);
fltrn=fltrOr(fltr1,fltr2);
fltrb=boxIndFltr(g,...
   nArr.nmin(1),nArr.nmax(1),...
   nArr.nmin(2),nArr.nmax(2),...
   nArr.nmin(3),nArr.nmax(3));
%
cells=fltrAnd(fltrn,fltrb);
%
fipNet=ones(size(g.cells.indexMap));
fipNet(cells)=2;
end

