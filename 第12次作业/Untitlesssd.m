clc;
clear;
syms x1 x2;
X=[x1,x2];
f=100*(X(2)-X(1)^2)^2+(1-X(1))^2;
F=eval(['@(x1,x2)',vectorize(f)]);
z=-1;
r=4;
xx =linspace(-1,0.1,2);
yy = linspace(-1,0.1,2);
[X,Y] = meshgrid(xx,yy);
Z=F(X,Y);
contour(X,Y,Z)