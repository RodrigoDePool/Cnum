N = 100; 
m = 3;
S = 20;
%%generacion del vector t de antes para optimizar tiempo
t=zeros(N,1);
for n=m:N
    for j=1:S
    A = randn(n);
    tic;
    [L,U]=gaussLU(A);
    t(n) = t(n) + toc/S;
    end 
end

%% plot(t(m+2:N))
%% si esto es una recta de pendiente 3 entonces sabemos que la funcion 
%% crece de forma cubica
plot(log(m+2:N),log(t(m+2:N)));
hold on;
fplot(@(x) 3*(x-4)-5.8,[2,4.55],'r');
