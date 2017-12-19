clc;
clear;
N=20;
G=hilb(N);
b=ones(N,1);
x=zeros(N,1);
g = G*x-b;
p = -g;
k = 0;
while(norm(g)>1e-6)
    k = k + 1
    d=G*p;
    a=(g'*g)/(p'*d);
    x = x+a*p;
    g1=g+a*d;
    b=(g1'*g1)/(g'*g);
    g=g1;
    p=-g+b*p;
end
