clc;
clear;
mu=1;
%fun = @(x)3*x(1)^2 + 2*x(1)*x(2) + x(2)^2 - 4*x(1) + 5*x(2);
fun = @(x) -9*x(1)-10*x(2)-mu*(log(100-x(1)-x(2))+log(x(1))+log(x(2))+log(50-x(1)+x(2)));
x0 = [8,90];
options = optimoptions(@fminunc,'Display','iter-detailed','Algorithm','quasi-newton','PlotFcn',{@optimplotfval});
[x,fval,exitflag,output] = fminunc(fun,x0,options)
