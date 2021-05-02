%绘制Rosenbrock函数图形
x=[-8:1:8];  
y=x;  
[X,Y]=meshgrid(x,y);  
[row,col]=size(X);  
for l=1:col  
    for h=1:row  
        z(h,l)=Rosenbrock([X(h,l),Y(h,l)]);  
    end  
end  
surf(X,Y,z);  
shading interp  

function result=Rosenbrock(x)  
%Rosenbrock 函数  
%输入x,给出相应的y值,在x=(1,1) 处有全局极小点0,为得到最大值，返回值取相反数   
[row,col]=size(x);  
if row>1  
    error('输入的参数错误');  
end  
result=100*(x(1,2)-x(1,1)^2)^2+(x(1,1)-1)^2;  
result=log(1+result);  
end

