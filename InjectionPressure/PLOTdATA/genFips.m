function fips = genFips(g,nArr)
fipNet=genNetFip(g,nArr);
fipBox=genBoxFip(g,nArr);
fips={fipNet fipBox};
end

