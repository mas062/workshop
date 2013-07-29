function K = genKs(k,g,nArr)
kc=[];
for i=1:numel(k),
   for j=median(1:numel(k)),
      kc{end+1} ={k(i) k(j)};
   end
end
fips=genFips(g,nArr);
Kn = cellfun(@(x) genK(x,fips{1}),kc,'UniformOutput',false);
Kb = cellfun(@(x) genK(x,fips{2}),kc,'UniformOutput',false);
K={Kn Kb};
end

