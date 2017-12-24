P1=load('m519_1.mat','P');
P2=load('m519_2.mat','P');
P3=load('m519_3.mat','P');
P4=load('m519_4.mat','P');

figure;
hold on;
plot(P1.P)
plot(P2.P)
plot(P3.P)
plot(P4.P)