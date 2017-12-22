clc;
clear;
N=8;
X=zeros(N,1);
P=zeros(N,1);
step=0;
for i=0:0.25:N
    step=step+1;
    X(step)=5+i;
    x=X(step);
    for j=1:100
        x=x-0.25*(x-7)*(9*x-67);
    end
    P(step)=x;
end
hold on
plot(P)