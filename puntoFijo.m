function [c,n,e]=puntoFijo(f,x0)
    x1=f(x0);
    n=1;
    e=10^-6;
    while abs(x1-x0)>e
        x0=x1;
        x1=f(x1);
        n=n+1;
    end
    c=x1;
end
    