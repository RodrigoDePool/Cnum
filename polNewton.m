%Function that returns the evaluation of a vector 'x' in the Newton Polinomial
%The polinomial is generated in the points (x1(i),f(x1(i))), the return value is 
% a vector y
function y = polNewton(x,f,x1)
  %CONDITIONS
  
  
  %Lista de diferencias divididas
  D = difDivididas(f,x1);
  
  size1 = length(x);
  y = zeros(1,size1);
  for i=1:length(x)
    y(i) = resultNewt(D,x1,x(i));
  end

end

function res = coefNewton(x1,x)
  res = 1;
  for i=1:length(x1)
    res = res*(x-x1(i));  
  end
end

function res = resultNewt(D,x1,x)
  res = D(1);
  for i = 2 : length(D)
    res = res + coefNewton(x1(1:i-1),x)*D(i);
  end
end

function D = difDivididas(f,x1)
  k = length(x1);
  D = zeros(k);
  D(1) = f(x1(1));
  for i=2:k
    prod = f(x1(i)) - resultNewt(D(1:i-1),x1(1:i-1),x1(i));
    for j = 1:i-1
      prod = prod * (1/(x1(i) - x1(j)));
    end
    D(i) = prod;
  end
end



