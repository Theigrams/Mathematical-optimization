clc;
clear;
N=4;
G=zeros(N,N);
b=[-1,0,2,5^(0.5)]';
x0=zeros(N,1);
for i= 1:N
     G(i,i) = 2;
end

for i= 1:N-1
    G(i+1,i)=-1;
    G(i,i+1)=-1;
end
    x = x0;x'
    g = G*x+b;
    p = -g;
    k = 0;
    while 1
        if norm(g, 2)<1e-6
            break
        end
        k = k + 1;
        
        d=G*p;
        a=(g'*g)/(p'*d);

        x = x+a*p;x'
        t=g+a*d;
       beta=(t'*t)/(g'*g);
       g=t;
       p=-g+beta*p;
  
    end