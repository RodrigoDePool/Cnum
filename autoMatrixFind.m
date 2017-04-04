
function [l,u] = autoMatrixFind(M)
    [a1,a2]=size(M);
    
    
    b=randn(a1,1);
    u=b;
    
    aux=0;
    l=1;
    n=0;
    
    while ((1e-10)<(norm(l-aux)) && n<1000) 
        aux=l;
        
        u=M*u./norm(M*u);
        n=n+1;
        l=M*u./u;
    end
    l=M*u./u;

end

