%% Funcion que devuelve la descomposicion LU de A
function [L,U]=gaussLU(A)
    [n,m]=size(A);
    %% n es la dimension de A
    if(n~=m)
        error('la matriz no es cuadrada');
    end
    
    U=A;
    L=eye(n);
    
    for k=1:n-1
        if(U(k,k)==0)
            error('El elemento diagonal %d se ha anulado',k);
        end    
        for i=k+1:n
            L(i,k)=U(i,k)/U(k,k);
            for j=k:n
                U(i,j)=U(i,j)-L(i,k)*U(k,j);
            end
        end
    end
end