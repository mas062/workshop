function [] = pltInjPrs(gLRG,gSML,nArr,csArr,colArr)
global colorCounter;
colorCounter=0;
hArr = cellfun(@(x) figure(),{1 2 3 4}, 'UniformOutput',false);
csD = cellfun(@(x) getPrsCs(gLRG,gSML,x,nArr),csArr,'UniformOutput',false);
cellfun(@(x) plotPrsCs(hArr,x),csD,'UniformOutput',false);
   function [] = plotPrsCs(hArr,csData)
      csData(end).sr
      colorCounter=colorCounter+1;
      figure(hArr{1});
      hold on;
      plot([csData.t],[csData.PCO2],colArr{colorCounter});
      title('PCO2');
      %
      figure(hArr{2});
      hold on;
      plot([csData.t],[csData.P],colArr{colorCounter});
      title('Pave');
      %
      x=csData.r;
      y=csData(end).pr;
      figure(hArr{3});
      hold on;
      plot([csData.r],csData(end).pr,colArr{colorCounter});
      title('P vs r');
      %
      figure(hArr{4});
      hold on;
      plot([csData.r],csData(end).sr,colArr{colorCounter});
      title('CO2 vs r');
      %
   end
   function [csData] = getPrsCs(gLRG,gSML,cs,nArrLRG)
      g=gLRG;
      nArr=nArrLRG;
      cells = boxIndFltr(g,...
         nArr.nmin(1),nArr.nmax(1),...
         nArr.nmin(2),nArr.nmax(2),...
         nArr.nmin(3),nArr.nmax(3));
      init = readEclipseOutput([cs '.FINIT']);
      pv = init.PORV.values;
      if ~isempty(strfind(cs,'SML')), 
         g=gSML;
         pv=pv(cells);
         ndims=[57 155 4];nmin=[1 1 1];nwl=[18 72 4];nmax=[57 155 4];
         nArr=struct('dims',ndims,'nmin',nmin,'nmax',nmax,'nwl',nwl);
      end
      
      [smry rst] = readEclipseResults([projDir() cs],'RestartData', true);
      %extraxt arguments for function calls
      cells = boxIndFltr(g,...
         nArr.nmin(1),nArr.nmax(1),...
         nArr.nmin(2),nArr.nmax(2),...
         nArr.nmin(3),nArr.nmax(3));
      radi= boxIndFltr(g,...
         nArr.nwl(1),nArr.nmax(1),...
         nArr.nwl(2),nArr.nwl(2),...
         nArr.nwl(3),nArr.nmax(3));
      %       plotCellData(g, sw_shot, cells, 'EdgeColor', 'none');
      %       colorbar;
      cent= boxIndFltr(g,...
         nArr.nwl(1),nArr.nwl(1),...
         nArr.nwl(2),nArr.nwl(2),...
         nArr.nwl(3),nArr.nwl(3));
      sw=rst.SWAT;pco2=rst.PRESSURE;
      %function calls
      p_co2 = P_aveCO2(cells,pv,sw,pco2);
      p_ave = P_ave(cells,pv,pco2);
      [p,s] = PS_r(radi,sw,pco2);
      %extra variables
      r = g.cells.centroids(radi,1)-g.cells.centroids(cent,1);
      t = rst.TIME(rst.ReportNo+1);
      %append to struct
      csData=struct('PCO2',p_co2,'P',p_ave,'pr',p,'sr',s,'r',r,'t',t);
   end

   function [p_avc] = P_aveCO2(cells,pv,sw,pco2)
      pv=pv(cells);
      
      sco2=cellfun(@(x) 1-x(cells),sw, 'UniformOutput',false);
      p=cellfun(@(x) x(cells),pco2, 'UniformOutput',false);
      p_avc=cellfun(@(x,y,z) sum(x.*y.*pv)./sum(y.*pv), p,sco2, 'UniformOutput',false);
   end
   function [p_ave] = P_ave(cells,pv,pco2)
      %cells = valFltr(init.FIPNUM.values,1,1);
      pv = pv(cells);
      p=cellfun(@(x) x(cells),pco2, 'UniformOutput',false);
      p_ave=cellfun(@(x,y,z) sum(x.*pv)./sum(pv), p, 'UniformOutput',false);
   end
   function [p,s] = PS_r(cells,sw,pco2)
      s =cellfun(@(x) 1-x(cells),sw, 'UniformOutput',false);
      p =cellfun(@(x) x(cells),pco2, 'UniformOutput',false);
   end
end