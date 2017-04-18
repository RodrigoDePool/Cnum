% Devuelve el vector yp con la interpolacion de lagrange en puntos
% de chebyshev, tambien devuelve el maximo del error (E)
%Parametros:
% [a,b] intervalo en que evaluamos f, en una cantidad de n puntos
% de chebyshev para generar el polinomio interpolador.
% xp son los puntos en los que evaluamos el polinomio interpolador
function [ yp, E ] = interpolacionCheby(a,b,f,xp,n)
    
    g0 = @(x) a + (x+1).*(b-a)./2;
    %Inversa de g0 
    g1 = @(x) 2.*(x-a)./(b-a) - 1;

    x0 = nodosCheby(n);
    
    u = g0(x0);
    yp = interpoladorLagrange(xp, u, f(u));
    E = max(abs(yp-f(xp)));
    return;
end

function x = nodosCheby(n)
    x = zeros(n);
    i = 1;
    while i <= n
        x(i) = cos(pi*(2*i-1)/(2*n));
        i = i + 1;
    end
    return;
end

