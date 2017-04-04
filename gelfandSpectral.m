function [x] = gelfandSpectral(A)
    tol = 10^-6;
    aux = normInf(A);
    B = A*A;
    i = 2;
    x = normInf(B)^(1/i);
    while abs(x-aux) > tol
        aux = x;
        B = B*A;
        i = i + 1;
        x = normInf(B)^(1/i);
    end
end

%%returns the value of the infinte norm of a matrix
function [x] = normInf(A)
    x = 0;
    [a , b] = size(A);
    for i = 1 : a
      num = 0;
      for j = 1 : a
          num = num + abs(A(i,j));
      end
      if(x < num)
          x = num;
      end
    end
end