%Prueba de Runge

f = @(x) 1./(1+x.*x);


xp = [-5 : 10^-1 : 5];

[yp,E] = pruebaInterpolacion(-5,5,f,xp,30);

plot(xp,yp);
hold on;
fplot(f,[-5,5]);