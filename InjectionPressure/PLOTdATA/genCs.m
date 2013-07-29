function genCs(k,g,nArr,mde)

nk=numel(k);
csNames=nameCases(nk,mde);
%
tmpN = [projDir 'TMP\SCN_' mde '_SG0.TMP'];
%
K =genKs(k,g,nArr);
%
cellfun(@(x,y) writeK(x,y),csNames{1},K{1},'UniformOutput',false);
%writeK(x,y),csNames{1},K{1},'UniformOuput',false);
cellfun(@(x) writeCs(x,tmpN,nArr),csNames{1},'UniformOutput',false);
%
cellfun(@(x,y) writeK(x,y),csNames{2},K{2},'UniformOutput',false);
cellfun(@(x) writeCs(x,tmpN,nArr),csNames{2},'UniformOutput',false);
%
end

