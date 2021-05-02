#-*- coding: UTF-8 -*-
"""
Newton法
Rosenbrock函数
函数 f(x)=100*(x(2)-x(1).^2).^2+(1-x(1)).^2
梯度 g(x)=(-400*(x(2)-x(1)^2)*x(1)-2*(1-x(1)),200*(x(2)-x(1)^2))^(T)
"""

import numpy as np
import matplotlib.pyplot as plt
def F(x):
    return (10*(x[0]**2)-18*x[0]*x[1]+10*x[1]*x[1])/2+4*x[0]-15*x[1]+13
def jacobian(x):
    return np.array([10*x[0]-9*x[1]+4,-9*x[0]+10*x[1]-15])

def hessian(x):
    return np.array([[10,-9],[-9,10]])



X1=np.arange(-2,12+0.05,0.05)
X2=np.arange(-1,7+0.05,0.05)
[x1,x2]=np.meshgrid(X1,X2)
f=(10*(x1**2)-18*x1*x2+10*x2*x2)/2+4*x1-15*x2+13; # 给定的函数
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
    alpha = 1.0

    while i<imax and delta>10**(-8):
     #   p = -np.dot(np.linalg.inv(hessian(x)),jacobian(x))
        p=-jacobian(x)
        x0 = x
        alpha=1.0*np.dot(jacobian(x).transpose(),jacobian(x))/np.dot((np.dot(jacobian(x).transpose(),hessian(x))),jacobian(x))
        q1=F(x)
        x = x + alpha*p
        q2 =F(x)
        W[:,i] = x
        delta = sum((x-x0)**2)
        print('第 %d 次迭代结果:'%(i))
        print(x)
        print('r=%lf'%((q2+22)/(q1+22))**1)
        i=i+1
    W=W[:,0:i]  # 记录迭代点
    return W

x0 = np.array([-1,1])
W=newton(x0)

plt.plot(W[0,:],W[1,:],'g*',W[0,:],W[1,:]) # 画出迭代点收敛的轨迹
plt.show()