%Steihaug共轭梯度法 for Problem 6.8
clc;
clear;
ns=0.25;
nv=0.75;
ri=2;
rd=0.5;
n=50;
delta=1;
xx=zeros(2*n,1);
X = sym('x', [2*n,1]) ;  %符号表达式定义x1,x2,...x2n
f=0;    
for i=1:n
    f=f+(1-X(2*i-1))^2+10*(X(2*i)-X(2*i-1)^2)^2;    %符号表达式定义f(x)
end

grad=gradient(f,X);  %计算梯度向量的表达式
Hess=hessian(f,X);    %计算hessian阵的表达式
g=1;
global  step
step=0;
global op;
op=0;

while (norm(g)>10e-6)
    step=step+1;
    double(subs(f,X,xx))
    g=double(subs(grad,X,xx));
    B=double(subs(Hess,X,xx));
    s=Steihaug(g,B,n,delta);
    p=-1*(double(subs(f,X,xx))-double(subs(f,X,(xx+s))))/(s'*g+0.5*s'*B*s );
    
    if(p<=0)
        fprintf('Unsuccessful\n')
    else
        xx=xx+s;
    end
    if(p>=nv)
        delta=delta*ri;
        fprintf('Very successful\n')
    elseif(p>ns)
        delta=delta;
        fprintf('Successful\n')
    else
        delta=delta*rd;
    end
    %p
end

fprintf('最优值为%f\n求解子问题%d次，其中共轭梯度法一共迭代%d次\n',double(subs(f,X,xx)),step,op)
fprintf('最优最优解为:')
xx

%%
%Steihaug共轭梯度法
function s=Steihaug(g,B,n,delta)
    global op
    eps=10e-6;
    x=zeros(2*n,1);
    r=g;
    r0=r;
    p=-r;
    while (1)
        s=x;-
        if(norm(r)<=eps)
            fprintf('抵达子问题最优解\n')
            return 
        end
        op=op+1;
    	if(p'*B*p<=0)
            t=find(x,p,delta);
            s=x+double(t)*p;
            fprintf('抵达边界\n')
            return 
        end
        d=B*p;
        a=(r'*r)/(p'*d);
        if(norm(x+a*p)>=delta)
            t=find(x,p,delta);
            s=x+double(t)*p
            fprintf('抵达边界\n')
            return 
        end
        x=x+a*p;
        r1=r+a*d;
        if(norm(r1)<eps*norm(r0))
             s=x;
             fprintf('抵达子问题最优解\n')
             return
        end
        b=(r1'*r1)/(r'*r);
        r=r1;
        p=-r+b*p;
    end
end


function t=find(x,p,delta)
    syms a;
    eqn = (x'+a*p')*(x+a*p)== delta;
    t=vpasolve (eqn,a,[0,delta/norm(p)*2]);
end
    
function ss=choose(x,p,B,g,t)
    global op
    ss=x+double(t)*p;
    return 
    x1=x+double(t(1))*p;
    x2=x+double(t(2))*p;
    y1=0.5*x1'*B*x1+g'*x1;
    y2=0.5*x2'*B*x2+g'*x2;
    if(y1<y2)
        disp('!!!!!!!')
        op
    end
    if(y1>y2)
        ss=x2;
        return
    else
        ss=x1;
        return 
    end
end
