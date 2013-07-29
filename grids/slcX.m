function hs=slcX(hf,C,clr)
figure(hf);
v=caxis;
ha=findobj(hf,'Type','Axes','-not','Tag','Colorbar');
lx=get(ha,'XLim');
ly=get(ha,'YLim');
lz=get(ha,'ZLim');
n=100;
%
x=linspace(lx(1),lx(end),n);
y=linspace(ly(1),ly(end),n);
z=linspace(lz(1),lz(end),n);
%
[Y,Z]=meshgrid(y,z);
%
X=0*Y+C;
%
hold on;
hs=surf(X,Y,Z,'FaceColor',clr,'EdgeColor','none');
set(hs,'Tag','XSlice');
caxis(v);
%
end