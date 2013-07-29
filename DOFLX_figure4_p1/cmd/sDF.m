function sDF(h,fN)
phdPth = 'C:\Users\meisama\Documents\PhD\';
prjPth = [phdPth 'workshop\DOFLX_figure4_p1\'];
picPth = [prjPth 'PICs\'];
rN=[picPth fN];
saveas(h,[rN '.fig']);
%print(h,'-depsc',[rN '.eps']);
print(h, '-depsc2', [rN '.eps']);
%saveas(h,[rN '.png']);
% !eps2pdf([rN '.eps']);
end

