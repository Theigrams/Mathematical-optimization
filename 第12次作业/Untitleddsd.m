n = 4;
i = 1;
j = 1;
G = zeros(n,n);
b = zeros(1,n)';
x0= [-1 0 2 (5^(0.5))]';
x = x0;
while(i<=n)
    G(i,i) = 2;
    i = i+1;
end
i=1;
while(i<=n-1)
    G(i+1,i)=-1;
    G(i,i+1)=-1;
    i = i + 1;
end
i = 1;
g = G * x0 - b
i = 1;
E1 = 0;
while(i<=n)
    E1 = E1 +(g(i))^2;
    i = i + 1;
end
i = 1;
E = sqrt(E1);
p = -1*g;
k = 1;
while (E>(10^(-6)))
    d = G*p;
    h = g'*g;
    a = h/(p'*d);
    x = x + a*p
    g = g + a*d
    B = (g'*g)/h;
    p = -g +B*p;
    k = k + 1;
   while(i<=n)
      E1 = E1 +(g(i))^2;
      i = i + 1;
   end
   i = 1;
   E = sqrt(E1);  
    E1 = 0;
end
