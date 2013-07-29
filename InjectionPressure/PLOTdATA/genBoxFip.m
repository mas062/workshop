function fipBox = genBoxFip(g,nArr)
nr=min(2,min(nArr.nmax(1:2)));
%
fltrbin =boxIndFltr(g,...
   nArr.nwl(1)-nr,nArr.nwl(1)+nr,...
   nArr.nwl(2)-nr,nArr.nwl(2)+nr,...
   1,nArr.dims(3));
%
fipBox=ones(size(g.cells.indexMap));
fipBox(fltrbin)=2;
end

