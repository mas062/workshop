function perm = genK(kv,fip)
permx=fip*kv{2};
permx(fip==2)=kv{1};
permy=permx;
permz=0.1*permx;
perm = [permx permy permz];
end

