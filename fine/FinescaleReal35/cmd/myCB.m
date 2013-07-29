function [hc] = myCB(mn,mx,lg,orientation )
d=1:64;
switch orientation,
   case 'horizontal'
      m=3;n=1;
      tck='YTick';
   case 'Horizontal'
      m=3;n=1;
      tck='YTick';
   case 'vertival'
      m=1;n=3;
      tck='XTick';
   case 'Vertival'
      m=1;n=3;
      tck='XTick';
end
L=[0.001 0.01 0.1 0.2 ...
   0.5 1 2 5 10 20 50 ...
   100 200 500 1000 2000 ...
   5000 10000];
rng=mx-mn;
x = 1+63*(log10(L)-mn)/rng;
y=[0 rng/10 
      set(gca,tck,[]);
      axis image;
end

