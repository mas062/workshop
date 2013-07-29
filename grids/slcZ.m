function hs=slcZ(hf,C,clr)
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
[X,Y]=meshgrid(x,y);
%
Z=0*X+C;
%
hold on;
hs=surf(X,Y,Z,'FaceColor',clr,'EdgeColor','none');
set(hs,'Tag','ZSlice');
caxis(v);
%
end