clc;
clear;
for i=0:0.003:0.88
    X=zeros(1,10);
    x=7+i;
    step=1;
    X(step)=x;
    while (step<10)
        step=step+1;
        x=x-0.25*(x-7)*(9*x-67);
        X(step)=x;
    end
    hold on
    plot(X)
end