function csNames = nameCases(nk,mde)
netCases=[];
boxCases=[];
for i=1:nk,
   for j=median(1:nk),
      netCases{end+1}=['INJPRS_' mde '_NET_' num2str(i) num2str(j)];
      boxCases{end+1}=['INJPRS_' mde '_BOX_' num2str(i) num2str(j)];
   end
end
csNames = {netCases boxCases};
end

