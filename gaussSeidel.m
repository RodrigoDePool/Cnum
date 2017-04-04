function [x]=gaussSeidel(A,b)
    [l, l1] = size(A);
    if(l ~= l1)
         error('A is a rectangular matrix');
    elseif( isConver(A) == 0)
         error('A is not convergent');
    end
    
    x = diag(eye(l));
    aux = diag(eye(l)-eye(l));
    tol = 10^-6;
    
    while norm(x-aux) > tol
        aux = x;
        for i = 1:l
            sum = 0;
            for j = 1:l
                if(i ~= j)
                    sum = sum + A(i,j)*x(j);
                end
                x(i) = (b(i)-sum)/A(i,i);       
            end
        end
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