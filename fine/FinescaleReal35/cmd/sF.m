function sF(h,fN)
phdPth = 'C:\Users\meisama\Documents\PhD\';
prjPth = [phdPth 'fine\FinescaleReal35\'];
picPth = [prjPth 'pic\'];
rN=[picPth fN];
saveas(h,[rN '.fig']);
%print(h,'-depsc',[rN '.eps']);
print(h, '-depsc2', [rN '.eps']);
%saveas(h,[rN '.png']);
% !eps2pdf([rN '.eps']);
end

