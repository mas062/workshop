function slcY(hf,C)
lx=[0 3000];
ly=[0 10000];
lz=[1800 2600];
C=4000;
x=lx(1):10:lx(2);
y=ly(1):10:ly(2);
z=lz(1):1:lz(2);
%
[X,Z]=meshgrid(x,z);
%
Y=0*X+C;
%
surf(X,Y,Z)
%