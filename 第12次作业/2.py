#-*- coding: UTF-8 -*-
"""
Newton法
Rosenbrock函数
函数 f(x)=100*(x(2)-x(1).^2).^2+(1-x(1)).^2
梯度 g(x)=(-400*(x(2)-x(1)^2)*x(1)-2*(1-x(1)),200*(x(2)-x(1)^2))^(T)
"""
rou=0.01
import numpy as np
import matplotlib.pyplot as plt
def F(x):
    return 100*(x[1]-x[0]**2)**2+(1-x[0])**2;

def jacobian(x):
    return np.array([-400*x[0]*(x[1]-x[0]**2)-2*(1-x[0]),200*(x[1]-x[0]**2)])

def hessian(x):
    return np.array([[-400*(x[1]-3*x[0]**2)+2,-400*x[0]],[-400*x[0],200]])

def phi(a,x,p):
    return F(x+a*p)


def Apha(x,p,g):
    a=1
    while(phi(a,x,p)>=F(x)+rou*np.dot(p.transpose(),g)*a):
        a=0.9*a
    return a

X1=np.arange(-1.5,2+0.05,0.05)
X2=np.arange(-3.5,3+0.05,0.05)
[x1,x2]=np.meshgrid(X1,X2)
f=100*(x2-x1**2)**2+(1-x1)**2; # 给定的函数
plt.contour(x1,x2,f,20) # 画出函数的20条轮廓线


def newton(x0):

    print('初始点为:')
    print(x0,'\n')
    W=np.zeros((2,10**3))
    i = 1
    imax = 1000
    W[:,0] = x0
    x = x0
    delta = 1
    alpha = 1

    while i<imax and delta>10**(-10):
        #p = -np.dot(np.linalg.inv(hessian(x)),jacobian(x))
        p=-jacobian(x)
        x0 = x
       # alpha=1.0*np.dot(jacobian(x).transpose(),jacobian(x))/np.dot((np.dot(jacobian(x).transpose(),hessian(x))),jacobian(x))
        alpha=Apha(x,p,jacobian(x))
        print('步长为:')
        print(alpha)
       # alpha=1.0
        x = x + alpha*p
        W[:,i] = x
        delta = sum((x-x0)**2)
        print('第 %d 次迭代结果:'%(i))
        print(x)
        i=i+1
    W=W[:,0:i]  # 记录迭代点
    return W

x0 = np.array([-1,1])
W=newton(x0)

plt.plot(W[0,:],W[1,:],'g*',W[0,:],W[1,:]) # 画出迭代点收敛的轨迹
plt.show()