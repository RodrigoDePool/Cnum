F = @(x) (exp(x)-exp(-x))./(2*x);
%fplot(F,[-1*1e-6,1*1e-6]);
 b=1e-5;
 a=-b;
 %Dividimos el intervalo b a, en 1 millon de numeros
 d=(b-a)/1e7;
 x=a:d:b;
 plot(x,F(x));