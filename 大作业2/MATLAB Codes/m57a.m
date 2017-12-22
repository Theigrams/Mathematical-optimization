clc;
clear;
N=20;
for i=0:0.05:5
    X=zeros(1,N);
    x=8+i;
    step=1;
    X(step)=x;
    while (step<N+1)
        step=step+1;
        x=x-0.25*(x-7)*(9*x-67);
        X(step)=x;
    end
    hold on
    plot(X)
end