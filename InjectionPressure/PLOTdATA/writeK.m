function writeK(cs,kc)
fN_DATA = [projDir cs '.PERM'];
[cid msg] = fopen(fN_DATA,'wt');

fprintf(cid,'%s \n','PERMX');
fprintf(cid,'%e \n',kc(:,1));
fprintf(cid,'%s \n','/');

fprintf(cid,'%s \n','PERMY');
fprintf(cid,'%e \n',kc(:,2));
fprintf(cid,'%s \n','/');

fprintf(cid,'%s \n','PERMZ');
fprintf(cid,'%e \n',kc(:,3));
fprintf(cid,'%s \n','/');

fclose(cid);

end

