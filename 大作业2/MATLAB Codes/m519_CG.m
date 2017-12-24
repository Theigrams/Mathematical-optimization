%Conjugate Gradient method for Problem 5.19
clc;
clear;
N=12;
step=1;
G=hilb(N);
b=ones(N,1);
x=zeros(N,1);
P=zeros(N,1);
g = G*x-b;
P(step)=norm(g);
p = -g;
while(norm(g)>1e-6)
    step = step + 1;
    d=G*p;
    a=(g'*g)/(p'*d);
    x = x+a*p;
    g1=g+a*d;
    b=(g1'*g1)/(g'*g);
    g=g1;
    P(step)=norm(g);
    p=-g+b*p;
end
