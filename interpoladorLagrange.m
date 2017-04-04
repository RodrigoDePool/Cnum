function p = interpoladorLagrange(x,v,y)
    [a1,n1] = size(v);
    [a2,n2] = size(y);
    [a3,n3] = size(x);
    
    if( n1 ~= n2)
        error('Los tamanios no son iguales');
        return;
    elseif(a1 ~= 1 && a1 ~= 1 && a3 ~= 1 )
        error('No son vectores filas');
        return;
    end
   
    
    p = zeros(1,n3);
    for i=1:n3
        for ind=1:n1
            L = caracteristico_Lagrange(x(i),v);
            p(i) = p(i) + y(ind)*L(ind);
        end
    end

end

function L = caracteristico_Lagrange(x,v)
    [a,n] = size(v);
    L = zeros(1,n);
    for j=1:n
        prod = 1;
        for i = 1:n
            if(i ~= j)
                prod = prod * (x-v(i))/(v(j)-v(i));
            end
        end
        L(j) = prod;
    end
end
