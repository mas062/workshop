%% Define the Case
%
%===>
%
pth='C:\Users\meisama\Documents\PhD\workshop\DOFLX_figure4_p1\';
pthPic=[pth 'PICs\'];
%
dgray=0.5*ones(1,3);
gray=0.65*ones(1,3);
cls={...
   'C11211' ...
   'C02222' ...
   'C03211' ...
   'C03212' ...
   };
%
xs=6;
ys=60;
c={...
   [xs  ys  12] ...
   [xs  ys  18] ...
   [xs  ys   8] ...
   };
nx=40;ny=120;nz=20;
ts=1;ti=123;te=401;
nc=numel(c);
cl=struct2array(load([pth 'cmd\cl.mat']));
lgn=cellfun(@(x) strcat(...
   num2str(x(1)),'\_', ...
   num2str(x(2)),'\_', ...
   num2str(x(3))), c, 'UniformOutput', false);
%
hf=[];hg=[];hxs=[];hys=[];ng=[];
for r=1:numel(cls),
   %
   gFN=[pth '\..\grids\g' cls{r}(2) '.mat'];
   sFN=[pth cls{r} '\' cls{r} '_SWAT.mat'];
   pFN=[pth cls{r} '\' cls{r} '_FLOOILI.mat'];
   tFN=[pth cls{r} '\' cls{r} '_times.mat'];
   txN=[pth cls{r} '\' cls{r} '_INIT.mat'];
   %
   %===> tranx
   %
   load(gFN);
   load(txN);
   sw=struct2array(load(sFN));
   p=struct2array(load(pFN));
   t=struct2array(load(tFN));
   fois=cellfun(@(x) sign(x),p,'UniformOutput',false);
   %
   eval(['Grd=g' cls{r}(2) ';']);
   %
   iMap=Grd.cells.indexMap;allCells=clrFltr(Grd);
   slcx=boxIndFltr(Grd,xs,xs,1,ny,1,nz);
   slcy=boxIndFltr(Grd,1,nx,ys,ys,1,nz);
   cellsx=fltrAnd(slcx,iMap);
   cellsy=fltrAnd(slcy,iMap);
   prp=struct(...
      'LogKx', log10(init.TRANX.values)  ...
      ,'LogKy', log10(init.TRANY.values)  ...
      ,'LogKz', log10(init.TRANZ.values)  ...
      ...%       ,'Phi',   init.PORO.values          ...
      ,'CO2atEOI', 1-sw{ti}                ...
      ,'CO2atEOS', 1-sw{te}                ...
      ,'FlowSign',   fois{ti}                ...
      );
   fldN=fieldnames(prp);
   for n=1:numel(fldN),
      prop=prp.(fldN{n});propName=fldN{n};
      hg(end+1)=figure;clf;ng{end+1}=[cls{r} '_' propName '_pers'];
      gridViz(Grd,allCells,prop,propName,'none');view(250,45);
      hxs(end+1)=slcX(hg(end),xs*75,dgray);
      hys(end+1)=slcY(hg(end),ys*75,gray);
      colorbar off;title([]);
      hg(end+1)=figure;clf;ng{end+1}=[cls{r} '_' propName '_slcy'];
      gridViz(Grd,cellsx  ,prop,propName,'none');view(90.1,0);
      hys(end+1)=slcY(hg(end),ys*75,dgray);
      colorbar off;title([]);
      hg(end+1)=figure;clf;ng{end+1}=[cls{r} '_' propName '_slcx'];
      gridViz(Grd,cellsy  ,prop,propName,'none');view(0.2,0)
      hxs(end+1)=slcX(hg(end),xs*75,dgray);
      colorbar off;title([]);
      %
   end
   hg(end+1)=figure;clf;ng{end+1}=[cls{r} '_hist_foiSX' ]
   vz=p{te}(cellsx);%.*(1-sw{te-1}).*init.PORO.values;
   v=vz(vz~=0);
   hist(v,100);title([cls{r}...
      ' x, mean= ' num2str(mean(v))]);
   colorbar off;title([]);
   clear Grd p sw fois init t prp prop v vz;
   %
   % % %    hf(end+1)=figure;hold on;hp=[];title(cls{r});
   % % %    %
   % % %    for n=1:nc,
   % % %       i=c{n}(1);j=c{n}(2);k=c{n}(3);
   % % %       cell_o=i+(j-1)*nx+(k-1)*nx*ny;
   % % %       cell=find(Grd.cells.indexMap==cell_o);
   % % %       pC=cellfun(@(x) x(cell), p, 'UniformOutput', false);
   % % %       hp(end+1)=plot(t(ts:te)/365,1-[pC{ts:te}],'Color',cl(n,:),'LineWidth',3);
   % % %    end
   % % %    legend(hp,lgn);
   for f=1:numel(hg),
      sDF(hg(f),ng{f});
   end
   close all;
end
