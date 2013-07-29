function writeCs(cs,tmpN,nArr)
% Data File name
fN_DATA = [projDir() cs '.DATA'];
[cid msg] = fopen(fN_DATA,'wt');
[fid, msg] = fopen(tmpN, 'rt');

% Loop into template file
while ~feof(fid),
    lin = fgetl(fid);
    if lin==-1
        error('Problem in reading the template file!');
    end
    if ~isempty(lin),
        kw = textscan(lin,'%s');
        fkw = char(kw{1});
    else
        fkw=[];
    end
%    
    if ~isempty(strmatch('${',fkw)),
        lin = fgetl(fid);
        if ~isempty(lin),
            kw = textscan(lin,'%s');
            fkw = char(kw{1});
            else
                fkw=[];
        end            
%            
        while isempty(strmatch('}$',fkw)) && ~feof(fid),
           if ~isempty(fkw),
              %DIMENS
              if strcmp(fkw,'DIMENS'),
                 fprintf(cid,'%s \n','DIMENS');
                 fprintf(cid,'%s \n',num2str(nArr.dims));
                 fprintf(cid,'%s \n','/');
                 display([fkw ' keyword DIMENS'...
                    ' has been appended for case ' cs]);
              end
              %GRID
              if strcmp(fkw,'GRID'),
                 kfN = [projDir() 'GRID_LRG.GRDECL'];
                 if exist(kfN,'file'),
                    fprintf(cid,'%s \n','INCLUDE');
                    fprintf(cid,'%s \n',['''' kfN '''']);
                    fprintf(cid,'%s \n','/');
                    display([fkw ' keyword GRID'...
                       ' has been appended for case ' cs]);
                 else
                    display(['GRID keyword '...
                       ' doesn''t exist for case ' caseName]);
                 end
              end
              %PERM
              if strcmp(fkw,'PERM'),
                 kfN = [projDir() cs '.PERM'];
                 if exist(kfN,'file'),
                    fprintf(cid,'%s \n','INCLUDE');
                    fprintf(cid,'%s \n',['''' kfN '''']);
                    fprintf(cid,'%s \n','/');
                    display([fkw ' keyword '...
                       ' has been appended for case ' cs]);
                 else
                    display(['Perm keyword '...
                       ' doesn''t exist for case ' caseName]);
                 end
              end
              %ACTNUM
              if strcmp(fkw,'ACTNUM'),
                 LIN1 = ['ACTNUM 0/'];
                 LIN2 = ['ACTNUM 1 '...                      ...
                    num2str(nArr.nmin(1)) ' '...
                    num2str(nArr.nmax(1)) ' '...
                    num2str(nArr.nmin(2)) ' '...
                    num2str(nArr.nmax(2)) ' '...
                    num2str(nArr.nmin(3)) ' '...
                    num2str(nArr.nmax(3)) ' '...
                    '/'];
                 fprintf(cid,'%s \n','EQUALS');
                 fprintf(cid,'%s \n',LIN1);
                 fprintf(cid,'%s \n',LIN2);
                 fprintf(cid,'%s \n','/');
                 display([fkw ' keyword '...
                    ' has been appended for case ' cs]);
              end
              %MULTPV LRG
              if strcmp(fkw,'LRGMULT'),
                 LIN1 = ['MULTPV 1E7 '...5
                    '1 '                      num2str(nArr.dims(1)) ' '...
                    num2str(nArr.dims(2)) ' ' num2str(nArr.dims(2)) ' '...
                    '1 '                      num2str(nArr.dims(3))   '/'];
                 LIN2 = ['MULTPV 1E7 '...5                      ...
                    '1 '   num2str(nArr.dims(1)) ' '...
                    '1 1 '                          ...
                    '1 '	num2str(nArr.dims(3)) '/'];
                 LIN3 = ['MULTPV 1E7 '...5
                    '1 1 '                            ...
                    '2 '   num2str(nArr.dims(2)-1) ' '...
                    '1 '   num2str(nArr.dims(3))      '/'];
                 fprintf(cid,'%s \n','EQUALS');
                 fprintf(cid,'%s \n',LIN1);
                 fprintf(cid,'%s \n',LIN2);
                 fprintf(cid,'%s \n',LIN3);
                 fprintf(cid,'%s \n','/');
                 display([fkw ' keyword '...
                    ' has been appended for case ' cs]);
              end
              %MULTPV SML
              if strcmp(fkw,'SMLMULT'),
                 LIN1 = ['MULTPV 1E+03 '...1.36E+06
                    num2str(nArr.nmin(1)) ' ' num2str(nArr.nmax(1)) ' '...
                    num2str(nArr.nmax(2)) ' ' num2str(nArr.nmax(2)) ' '...
                    num2str(nArr.nmin(3)) ' ' num2str(nArr.nmax(3)) '/'];
                 LIN2 = ['MULTPV 1E+03 '...7.57E+05
                    num2str(nArr.nmin(1)) ' ' num2str(nArr.nmax(1)) ' '...
                    num2str(nArr.nmin(2)) ' ' num2str(nArr.nmin(2))  ' '...
                    num2str(nArr.nmin(3)) ' ' num2str(nArr.nmax(3)) '/'];
                 LIN3 = ['MULTPV 1E+03 '...9.80E+05
                    num2str(nArr.nmin(1)) ' ' num2str(nArr.nmin(1)) ' '...
                    num2str(nArr.nmin(2)+1) ' '...
                    num2str(nArr.nmax(2)-1) ' '...
                    num2str(nArr.nmin(3)) ' ' num2str(nArr.nmax(3)) '/'];
                 LIN4 = ['MULTPV 1E+01 '...1.36E+06
                    num2str(nArr.nmin(1)+1) ' ' num2str(nArr.nmax(1)) ' '...
                    num2str(nArr.nmax(2)) ' ' num2str(nArr.nmax(2)) ' '...
                    num2str(nArr.nmin(3)) ' ' num2str(nArr.nmax(3)) '/'];
                 LIN5 = ['MULTPV 1E+01 '...7.57E+05
                    num2str(nArr.nmin(1)+1) ' ' num2str(nArr.nmax(1)) ' '...
                    num2str(nArr.nmin(2)) ' ' num2str(nArr.nmin(2))  ' '...
                    num2str(nArr.nmin(3)) ' ' num2str(nArr.nmax(3)) '/'];
                 LIN6 = ['MULTPV 1E+01 '...9.80E+05
                    num2str(nArr.nmin(1)+1) ' ' num2str(nArr.nmin(1)+1) ' '...
                    num2str(nArr.nmin(2)+1) ' '...
                    num2str(nArr.nmax(2)-1) ' '...
                    num2str(nArr.nmin(3)) ' ' num2str(nArr.nmax(3)) '/'];
                 fprintf(cid,'%s \n','EQUALS');
                 fprintf(cid,'%s \n',LIN1);
                 fprintf(cid,'%s \n',LIN2);
                 fprintf(cid,'%s \n',LIN3);
                 fprintf(cid,'%s \n',LIN4);
                 fprintf(cid,'%s \n',LIN5);
                 fprintf(cid,'%s \n',LIN6);                 
                 fprintf(cid,'%s \n','/');
                 display([fkw ' keyword '...
                    ' has been appended for case ' cs]);
              end
              %DIMENS
              if strcmp(fkw,'SATHYST'),
                 fprintf(cid,'%s \n','SATNUM');
                 fprintf(cid,'%s \n',[num2str(prod(nArr.dims)) '*2']);
                 fprintf(cid,'%s \n','/');
                 display([fkw ' keyword SATHYST'...
                    ' has been appended for case ' cs]);
              end
              %DRILL
              if strcmp(fkw,'DRILL'),
                 LIN1=['I G '   num2str(nArr.nwl(1)) ' '...
                    num2str(nArr.nwl(2)) ' 1* OIL/']; 
                 LIN2=['I '...
                    num2str(nArr.nwl(1))      ' '...
                    num2str(nArr.nwl(2))      ' '...
                    '1 ' num2str(nArr.nwl(3)) ' '...
                    'OPEN 0 0 0.1/'];
                 fprintf(cid,'%s \n','WELSPECS');
                 fprintf(cid,'%s \n',LIN1);
                 fprintf(cid,'%s \n','/');
                 fprintf(cid,'%s \n','');
                 fprintf(cid,'%s \n','COMPDAT');
                 fprintf(cid,'%s \n',LIN2);
                 fprintf(cid,'%s \n','/');
                 display(['keyword DRILL'...
                    ' has been appended for case ' cs]);                 
              end
           end
           lin = fgetl(fid);
           if ~isempty(lin),
              kw = textscan(lin,'%s');
              fkw = char(kw{1});
           else
              fkw=[];
           end
        end
    else
        fprintf(cid,'%s \n',lin);
    end
end
fclose(cid);
fclose(fid);
end

