function [x] = jacobiSolve(A,b)
    [a,z] = size(A);
    
    if(a ~= z)
        error('The matrix is not square');

    elseif( isConver(A) == 0)
        error('The matrix is not convergent');
    end
    
    x = diag(eye(a));
    tol = 10^-6;
    T = diag(diag(A)) - A;
    Tinv = diagInverse(diag(diag(A)));
    
    aux = x;
    x = Tinv*(T*x+b);
    while norm(x-aux) > tol
        aux = x;
        x = Tinv*(T*x+b);
    end
end

%%This function returns 1 if the jacobi function is convergent, else
% returns 0
function [l] = isConver(A)
   l = 1;
   [a,b] = size(A);
   for i = 1:a
        num = abs(A(i,i));
        sum= 0;
        for j = 1:a
            if(j ~= i)
                sum = sum + abs(A(i,j));
            end
        end
        if(num < sum)
            a = 0;
            return;
        end
   end
end

%%returns the inverse function of a diagonal matrix
function [B] = diagInverse(A)
    [a,b] = size(A);
    B = eye(a);
    for i= 1 : a
        if(A(i,i)<0)
            error('Elemento diagonal 0');      
        end
        B(i,i) = 1/A(i,i);
    end
end