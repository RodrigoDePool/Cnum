% Devuelve el vector yp con la interpolacion de lagrange en puntos
% equiespaciados, tambien devuelve el maximo del error (E)
%Parametros:
% [a,b] intervalo en que evaluamos f, en una cantidad de n puntos
% equiespacioados para generar el polinomio interpolador.
% xp son los puntos en los que evaluamos el polinomio interpolador
function [ yp, E ] = pruebaInterpolacion(a,b,f,xp,n)
    num = b - a;
    u = [ a : num/n : b ];
    yp = interpoladorLagrange(xp, u, f(u));
    E = max(abs(yp-f(xp)));
    return;
end

