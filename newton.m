function [c,n,e]=newton(f,df,x0,t1,t2,Nmax)
    pf = @(x) x-f(x)/df(x);
    c=pf(x0);
    n=1;
    e=abs(c-x0);
    while (e>t1) && (abs(f(c))>t2) && (n<Nmax)
        x0=c;
        c=pf(c);
        n=n+1;
        e=abs(c-x0);
    end
end