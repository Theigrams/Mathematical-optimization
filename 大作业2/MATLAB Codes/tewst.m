
clc;
clear;
detalgx=-0.1:0.01:0.1;
detalgy=-0.2:0.01:0.2;
for X=1:1:length(detalgx)
Dx=detalgx(:,X); 
for Y=1:1:length(detalgy)
Dy=detalgy(:,Y);

% M=1*(1+Dy);
g=1;
N=3;
M=100;
v=1;
gm=1;
v1=v*(1+Dx);
v2=v*(1+Dy);
v3=v;
g1=gm;
g2=gm;
g3=gm;
alpha=(v*sqrt(omega1^2-omega^2+N*omega^2))/sqrt(N*v^2+M*g^2);
t=pi/alpha;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[pho_t]=Fidelityexpfig3(t,g1,g2,g3,omega1,omega2,omega3,v1,v2,v3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C1_t=sqrt(pho_t(1,1));
pho1_reduce1(X,Y)=(cos(theta/2))^4+pho_t(1,1)*(sin(theta/2))^4+...
(C1_t+conj(C1_t)+pho_t(3,3)+pho_t(4,4)+pho_t(5,5)+...
pho_t(6,6)+pho_t(7,7)+pho_t(8,8)+pho_t(9,9)+...
pho_t(10,10))*cos(theta/2)^2*sin(theta/2)^2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
C7_t=pho_t(7,1)/sqrt(pho_t(1,1));
pho2_reduce1(X,Y)=(cos(theta/2))^4+pho_t(7,7)*(sin(theta/2))^4+...
(C7_t+conj(C7_t)+pho_t(1,1)+pho_t(2,2)+pho_t(3,3)+...
pho_t(4,4)+pho_t(5,5)+pho_t(8,8)+pho_t(9,9)+...
pho_t(10,10))*cos(theta/2)^2*sin(theta/2)^2;

end
end
set(gca,'ydir','normal')
figure;
subplot(2,2,1);

%生成的图像的水平轴对应detalgy=-0.2:0.01:0.2;

%生成的图像的竖直轴对应detalgx=-0.1:0.01:0.1

imagesc(detalgy,detalgx,pho1_reduce1);