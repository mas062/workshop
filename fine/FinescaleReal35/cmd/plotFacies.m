%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% --------- Startup ENCL Project ----------
%
% %Startup mrst and encl
% 
%eval('run C:\Users\meisama\Documents\PhD\ENCL\enclstartup');

%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% ------------- Make Paths ----------------
%
phdPth = 'C:\Users\meisama\Documents\PhD\';
prjPth = [phdPth 'fine\FinescaleReal35\'];
matPth = [prjPth 'mat\'];
picPth = [prjPth 'pic\'];
%
%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% -------------- Load Mats ----------------
%
% load([matPth 'gp.mat']);
% load([matPth 'ugpc.mat']);
% load([matPth 'ugp.mat']);
% load([matPth 'satnum.mat']);
% load([matPth 'satnumc.mat']);
% load([matPth 'permx.mat']);
% load([matPth 'permxc.mat']);
%
%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% ------------- Global Setting ------------
%
%===> Load Data
%
load([matPth 'ugpc.mat']);
load([matPth 'ugp.mat']);
load([matPth 'satnum.mat']);
load([matPth 'satnumc.mat']);
%
fnt=15;
goldish=[254, 239, 97]/256;
cmp='jet';
edge='none';
%
%Close all windows
%
close all;
%
%Slices and layers
%
nxs=44;nzs=23;
nxsc=nxs/2;nzsc=(nzs+1)/4;
nxk=44;nzk=23;
nxkc=nxk/2;nzkc=(nzk+1)/4;
%===> Filters
%
%--- All cells
%
allCells=clrFltr(ugp);
allCellsc=clrFltr(ugpc);
%
%--- Layer for birds view
%
lyr=boxIndFltr(ugp,1,ugp.cartDims(1),1,ugp.cartDims(2),nzs,nzs);
lyrc=boxIndFltr(ugpc,1,ugpc.cartDims(1),1,ugpc.cartDims(2),nzsc,nzsc);
lyrk=boxIndFltr(ugp,1,ugp.cartDims(1),1,ugp.cartDims(2),nzk,nzk);
lyrkc=boxIndFltr(ugpc,1,ugpc.cartDims(1),1,ugpc.cartDims(2),nzkc,nzkc);
lyr1=boxIndFltr(ugp,1,ugp.cartDims(1),1,ugp.cartDims(2),nzk-2,nzk-2);
lyr2=boxIndFltr(ugp,1,ugp.cartDims(1),1,ugp.cartDims(2),nzk-1,nzk-1);
lyr3=boxIndFltr(ugp,1,ugp.cartDims(1),1,ugp.cartDims(2),nzk,nzk);
lyr4=boxIndFltr(ugp,1,ugp.cartDims(1),1,ugp.cartDims(2),nzk+1,nzk+1);
%
%---- Slice
%
slc=boxIndFltr(ugp,nxs,nxs,1,ugp.cartDims(2),1,ugp.cartDims(3));
slcc=boxIndFltr(ugpc,nxsc,nxsc,1,ugpc.cartDims(2),1,ugpc.cartDims(3));
%
%--- Slice Off
%
slcOff=boxIndFltr(ugp,...
   nxs,ugp.cartDims(1),1,ugp.cartDims(2),1,ugp.cartDims(3));
slcOffc=boxIndFltr(ugpc,...
   nxsc,ugpc.cartDims(1),1,ugpc.cartDims(2),1,ugpc.cartDims(3));
%
%===> Facies
%
%--- Fine
%
facies_1=valFltr(satnum,1,1);
facies_2=valFltr(satnum,2,2);
facies_3=valFltr(satnum,3,3);
facies_4=valFltr(satnum,4,4);
facies_5=valFltr(satnum,5,5);
facies_6=valFltr(satnum,6,6);
%
%--- Coarse
%
fc_1=valFltr(satnumc,1,1);
fc_2=valFltr(satnumc,2,2);
fc_3=valFltr(satnumc,3,3);
fc_4=valFltr(satnumc,4,4);
fc_5=valFltr(satnumc,5,5);
fc_6=valFltr(satnumc,6,6);
%
%===> Clear Data
%
clear ugp ugpc satnum satnumc;
%
%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% ------------ Top View Satnum ------------
%
%===> Load Data
%
load([matPth 'gp.mat']);
load([matPth 'gpc.mat']);
load([matPth 'satnum.mat']);
load([matPth 'satnumc.mat']);
%
%===> Top view satnum 
%
%---Fine
%
h=figure;
gridViz(gp,lyr,satnum,['Facies for layer ' num2str(nzs)],'k');
title([]);view(-90,90);set(gca,'FontSize',fnt);colorbar off;
axis image;%colormap(cmp);l=light;set(l,'Style','local');
%set(l,'Position',[0,5000,1500]);
sF(h,'fineSat_TopView');
%
%---Coarse
%
h=figure;
gridViz(gpc,lyrc,satnumc,['Facies for layer ' num2str(nzsc)],'k');
title([]);view(-90,90);set(gca,'FontSize',fnt);colorbar off;
axis image;axis on;sF(h,'coarseSat_TopView');
%
%===> Close Figures
%
close all
%
%===> Clear Data
%
clear gp gpc satnum satnumc;
%
%% ------------ Side View Satnum -----------
%
%===> Load Data
%
load([matPth 'gp.mat']);
load([matPth 'gpc.mat']);
load([matPth 'satnum.mat']);
load([matPth 'satnumc.mat']);
%
%===> Side view satnum (Actual Grid)
%
%---Fine
%
h=figure;
sh=gridViz(gp,slcOff,satnum,['Facies for layer ' num2str(nxs)],'k');
title([]);view(-130,55);set(gca,'FontSize',fnt);colorbar off;
axis normal;set(sh,'LineStyle',':');
%colormap(cmp);l=light;set(l,'Style','local');set(l,'Position',[0,5000,1500]);
sF(h,'fineSat_SideView_actual');
%
%---Coarse
%
h=figure;
sh=gridViz(gpc,slcOffc,satnumc,['Facies for layer ' num2str(nxsc)],'k');
title([]);view(-130,55);set(gca,'FontSize',fnt);colorbar off;
axis normal;axis on;set(sh,'LineStyle',':');
sF(h,'coarseSat_SideView_actual');
%
%===> Close Figures
%
close all
%
%===> Clear Data
%
clear gp gpc satnum satnumc;
%
%===> Side view satnum (Uniform Grid)
%
%===> Load Data
%
load([matPth 'ugp.mat']);
load([matPth 'ugpc.mat']);
load([matPth 'satnum.mat']);
load([matPth 'satnumc.mat']);
%
%---Fine
%
h=figure;
sh=gridViz(ugp,slcOff,satnum,['Facies for layer ' num2str(nxs)],edge);
title([]);view(-130,55);set(gca,'FontSize',fnt);colorbar off;
axis tight;set(sh,'LineStyle',':');
%colormap(cmp);l=light;set(l,'Style','local');set(l,'Position',[0,5000,1500]);
sF(h,'fineSat_SideView_uniform');
%
%---Coarse
%
h=figure;
sh=gridViz(ugpc,slcOffc,satnumc,['Facies for layer ' num2str(nxsc)],edge);
title([]);view(-130,55);set(gca,'FontSize',fnt);colorbar off;
axis tight;axis on;set(sh,'LineStyle',':');
sF(h,'coarseSat_SideView_uniform');
%
%===> Close Figures
%
close all
%
%===> Clear Data
%
clear ugp ugpc satnum satnumc;
%
%% ----------- Perspective Satnum ----------
%
%===> Load Data
%
load([matPth 'gp.mat']);
load([matPth 'gpc.mat']);
load([matPth 'satnum.mat']);
load([matPth 'satnumc.mat']);
%
%===> Side view satnum (Actual Grid)
%
%---Fine
%
h=figure;
sh=gridViz(gp,allCells,satnum,['Facies for layer ' num2str(nxs)],'k');
title([]);view(-130,55);set(gca,'FontSize',fnt);colorbar off;
axis normal;set(sh,'LineStyle',':');
%colormap(cmp);l=light;set(l,'Style','local');set(l,'Position',[0,5000,1500]);
sF(h,'fineSat_Perspective_actual');
%
%---Coarse
%
h=figure;
sh=gridViz(gpc,allCellsc,satnumc,['Facies for layer ' num2str(nxsc)],'k');
title([]);view(-130,55);set(gca,'FontSize',fnt);colorbar off;
axis normal;axis on;set(sh,'LineStyle',':');
sF(h,'coarseSat_Perspective_actual');
%
%===> Close Figures
%
close all
%
%===> Clear Data
%
clear gp gpc satnum satnumc;
%
%===> Side view satnum (Uniform Grid)
%
%
%===> Load Data
%
load([matPth 'ugp.mat']);
load([matPth 'ugpc.mat']);
load([matPth 'satnum.mat']);
load([matPth 'satnumc.mat']);
%
%---Fine
%
h=figure;
sh=gridViz(ugp,allCells,satnum,['Facies for layer ' num2str(nxs)],edge);
title([]);view(-130,55);set(gca,'FontSize',fnt);colorbar off;
axis tight;set(sh,'LineStyle',':');
%colormap(cmp);l=light;set(l,'Style','local');set(l,'Position',[0,5000,1500]);
sF(h,'fineSat_Perspective_uniform');
%
%---Coarse
%
h=figure;
sh=gridViz(ugpc,allCellsc,satnumc,['Facies for layer ' num2str(nxsc)],edge);
title([]);view(-130,55);set(gca,'FontSize',fnt);colorbar off;
axis tight;axis on;set(sh,'LineStyle',':');
sF(h,'coarseSat_Perspective_uniform');
%
%===> Close Figures
%
close all
%
%===> Clear Data
%
clear ugp ugpc satnum satnumc;
%
%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% ---------------- Satnum 1 ---------------
%
%===> Load Data
%
load([matPth 'ugp.mat']);
load([matPth 'ugpc.mat']);
load([matPth 'satnum.mat']);
load([matPth 'satnumc.mat']);
%
edge='k';propName='';
%
h=figure;trk1=satnum;trk1(facies_1(151:156))=1:6;
sh=gridViz(ugp,facies_1,trk1,...
   ['facies  1 '],edge);set(sh,'LineStyle',':');
title([]);view(130,60);set(gca,'FontSize',fnt);set(sh,'LineStyle',':');
colorbar off;axis tight;sF(h,'facies_1');
%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% ---------------- Satnum 2 ---------------
%
h=figure;trk2=satnum;trk2(facies_2(151:156))=1:6;
sh=gridViz(ugp,facies_2,trk2,...
   ['facies 2  '],edge);set(sh,'LineStyle',':');
title([]);view(130,60);set(gca,'FontSize',fnt);set(sh,'LineStyle',':');
colorbar off;axis tight;sF(h,'facies_2');
%
%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% ---------------- Satnum 3 ---------------
%
h=figure;trk3=satnum;trk3(facies_3(151:156))=1:6;
sh=gridViz(ugp,facies_3,trk3,...
   [propName 'facies  3 '],edge);set(sh,'LineStyle',':');
title([]);view(130,60);set(gca,'FontSize',fnt);set(sh,'LineStyle',':');
colorbar off;axis tight;sF(h,'facies_3');
%
%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% ---------------- Satnum 4 ---------------
%
h=figure;trk4=satnum;trk4(facies_4(151:156))=1:6;
sh=gridViz(ugp,facies_4,trk4,...
   [propName 'facies 4  '],edge);set(sh,'LineStyle',':');
title([]);view(130,60);set(gca,'FontSize',fnt);set(sh,'LineStyle',':');
colorbar off;axis tight;sF(h,'facies_4');
%
%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% ---------------- Satnum 5 ---------------
%
h=figure;trk5=satnum;trk5(facies_5(151:156))=1:6;
sh=gridViz(ugp,facies_5,trk5,...
   [propName 'facies 5  '],edge);set(sh,'LineStyle',':');
title([]);view(130,60);set(gca,'FontSize',fnt);set(sh,'LineStyle',':');
colorbar off;axis tight;sF(h,'facies_5');
%
%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% ---------------- Satnum 6 ---------------
%
h=figure;trk6=satnum;trk6(facies_6(151:156))=1:6;
sh=gridViz(ugp,facies_6,trk6,...
   [propName 'facies 6  '],edge);set(sh,'LineStyle',':');
title([]);view(130,60);set(gca,'FontSize',fnt);set(sh,'LineStyle',':');
colorbar off;axis tight;sF(h,'facies_6');
%
%===> Close Figures
%
close all
%
%===> Clear Data
%
clear ugp ugpc satnum satnumc;
%
edge='none';
%
%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% -------------- Kx Top View---------------
%
%===> Load Data
%
load([matPth 'gp.mat']);
load([matPth 'gpc.mat']);
load([matPth 'permx.mat']);
load([matPth 'permxc.mat']);
%
%edge='k';
%
prop=log(permx)/log(10);propName='Permeability';
propc=log(permxc)/log(10);propName='Permeability';
%
%===> Top view Kx 
%
%--- main layer
h=figure;
gridViz(gpc,lyrkc,propc,[propName 'layer ' num2str((nzk+1))/4],edge);
title([]);view(-90,90);set(gca,'FontSize',fnt);
colorbar off;axis image;hc=colorbar;set(hc,'Location','North');
xl=get(hc,'XTickLabel');x=str2num(xl(:,:));
X=double(int32(min(x)):1:int32(max(x)));
set(hc,'XTick',X,'XTickLabel',[10.^X],'FontSize',fnt);
sF(h,'permxc');
%
%% -------------- Kx Layer 1 ---------------
%
%--- layer 1
%
h=figure;
gridViz(gp,lyr1,prop,[propName 'layer ' num2str(nzk-2)],edge);
title([]);view(-90,90);set(gca,'FontSize',fnt);colorbar off;
% hc=colorbar('south');set(hc,'fontsize',fnt);
caxis([-2,4]);axis image;axis on;sF(h,'fineSat1');
%
%% -------------- Kx Layer 2 ---------------
%
%--- layer 2
%
h=figure;
gridViz(gp,lyr2,prop,[propName 'layer ' num2str(nzk-1)],edge);
title([]);view(-90,90);set(gca,'FontSize',fnt);colorbar off;
caxis([-2,4]);axis image;axis on;sF(h,'fineSat2');
%
%% -------------- Kx Layer 3 ---------------
%
%--- layer 3
%
h=figure;
gridViz(gp,lyr3,prop,[propName 'layer ' num2str(nzk)],edge);
title([]);view(-90,90);set(gca,'FontSize',fnt);colorbar off;
caxis([-2,4]);axis image;axis on;sF(h,'fineSat3');
%
%% -------------- Kx Layer 4 ---------------
%
%--- layer 4
%
h=figure;
gridViz(gp,lyr4,prop,[propName 'layer ' num2str(nzk+1)],edge);
title([]);view(-90,90);set(gca,'FontSize',fnt);colorbar off;
caxis([-2,4]);axis image;axis on;sF(h,'fineSat4');
%
%===> Close Figures
%
close all
%
%===> Clear Data
%
clear ugp ugpc permx permxc;
%
edge='none';
%

%
%% ------------- Kx Histogram --------------
%
%===> Load Data
%
load([matPth 'gp.mat']);
load([matPth 'gpc.mat']);
load([matPth 'permx.mat']);
load([matPth 'permxc.mat']);
%
Kx=log10(permx);
[nb xb]=hist(Kx,100);
%
h=figure;bh=bar(xb,nb);
set(bh,'FaceColor','r','EdgeColor','w');
% xl=get(gca,'XTickLabel');x=str2num(xl(:,:));
% X=double(int32(min(x)):1:int32(max(x)));
set(gca,'XTick',X,'XTickLabel',[10.^X],'FontSize',fnt);
sF(h,'Kxh_all');
%
%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% ----------------- Kxh 1 ------------------
%
Kx=log10(permx(facies_1));
Kxc=log10(permxc(fc_1));
[nb xb]=hist(Kx,100);
[nbc xbc]=hist(Kxc,10);
%===> Fine
h=figure;bh=bar(xb,nb);
set(bh,'FaceColor','r','EdgeColor','w');
xl=get(gca,'XTickLabel');x=str2num(xl(:,:));
X=double(int32(min(x)):1:int32(max(x)));
set(gca,'XTick',X,'XTickLabel',[10.^X],'FontSize',fnt);
sF(h,'Kxh_1');
%
%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% ----------------- Kxh 2 ------------------
%
Kx=log10(permx(facies_2));
Kxc=log10(permxc(fc_2));
[nb xb]=hist(Kx,100);
[nbc xbc]=hist(Kxc,10);
%===> Fine
h=figure;bh=bar(xb,nb);
set(bh,'FaceColor','r','EdgeColor','w');
xl=get(gca,'XTickLabel');x=str2num(xl(:,:));
X=double(int32(min(x)):1:int32(max(x)));
set(gca,'XTick',X,'XTickLabel',[10.^X],'FontSize',fnt);
sF(h,'Kxh_2');
%%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% ----------------- Kxh 3 ------------------
%
Kx=log10(permx(facies_3));
Kxc=log10(permxc(fc_3));
[nb xb]=hist(Kx,100);
[nbc xbc]=hist(Kxc,10);
%===> Fine
h=figure;bh=bar(xb,nb);
set(bh,'FaceColor','r','EdgeColor','w');
xl=get(gca,'XTickLabel');x=str2num(xl(:,:));
X=double(int32(min(x)):1:int32(max(x)));
set(gca,'XTick',X,'XTickLabel',[10.^X],'FontSize',fnt);
sF(h,'Kxh_3');
%%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% ----------------- Kxh 4 ------------------
%
Kx=log10(permx(facies_4));
Kxc=log10(permxc(fc_4));
[nb xb]=hist(Kx,100);
[nbc xbc]=hist(Kxc,10);
%===> Fine
h=figure;bh=bar(xb,nb);
set(bh,'FaceColor','r','EdgeColor','w');
xl=get(gca,'XTickLabel');x=str2num(xl(:,:));
X=double(int32(min(x)):1:int32(max(x)));
set(gca,'XTick',X,'XTickLabel',[10.^X],'FontSize',fnt);
sF(h,'Kxh_4');
%%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% ----------------- Kxh 5 ------------------
%
Kx=log10(permx(facies_5));
Kxc=log10(permxc(fc_5));
[nb xb]=hist(Kx,100);
[nbc xbc]=hist(Kxc,10);
%===> Fine
h=figure;bh=bar(xb,nb);
set(bh,'FaceColor','r','EdgeColor','w');
xl=get(gca,'XTickLabel');x=str2num(xl(:,:));
X=double(int32(min(x)):1:int32(max(x)));
set(gca,'XTick',X,'XTickLabel',[10.^X],'FontSize',fnt);
sF(h,'Kxh_5');
%%¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% ----------------- Kxh 6 ------------------
%
Kx=log10(permx(facies_6));
Kxc=log10(permxc(fc_6));
[nb xb]=hist(Kx,100);
[nbc xbc]=hist(Kxc,10);
%===> Fine
h=figure;bh=bar(xb,nb);
set(bh,'FaceColor','r','EdgeColor','w');
xl=get(gca,'XTickLabel');x=str2num(xl(:,:));
X=double(int32(min(x)):1:int32(max(x)));
set(gca,'XTick',X,'XTickLabel',[10.^X],'FontSize',fnt);
sF(h,'Kxh_6');
%
%===> Close Figures
%
close all
%
%===> Clear Data
%
clear ugp ugpc permx permxc;
%
%% END %% END %% END %% END %% END %% END %% END %%
%



