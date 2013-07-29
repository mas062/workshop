function plotTime(h,Grd,prp,t)
%
%
dgray=0.5*ones(1,3);
gray=0.65*ones(1,3);
nx=40;ny=120;nz=20;
xs=4;ys=60;zs=17;
%
iMap=Grd.cells.indexMap;allCells=clrFltr(Grd);
slcx=boxIndFltr(Grd,xs,xs,1,ny,1,nz);
slcy=boxIndFltr(Grd,1,nx,ys,ys,1,nz);
slcz=boxIndFltr(Grd,1,nx,1,ny,zs,zs);
cellsx=fltrAnd(slcx,iMap);
cellsy=fltrAnd(slcy,iMap);
cellsz=fltrAnd(slcz,iMap);
%
hg1=h(1);hold on;
hg2=h(2);hold on;
hg3=h(3);hold on;
hg4=h(4);hold on;
pause(1);
for tc=1:20:numel(t)-1,
   figure(hg1);clf;
   prop=prp{tc+1};propName=['Vector for time ' num2str(t(tc)/365)];
   gridViz(Grd,allCells,prop,propName,'none');view(250,45);
   hxs=slcX(hg1,xs*75,dgray);
   hys=slcY(hg1,ys*75,gray);
   figure(hg2);clf;
   gridViz(Grd,cellsx,prop,propName,'none');view(90,0);
   figure(hg3);clf;
   gridViz(Grd,cellsy  ,prop,propName,'none');view(0,0)
   figure(hg4);clf;
   gridViz(Grd,cellsz,prop,propName,'none');view(0,90);
   pause(0.1);
end
%
end
