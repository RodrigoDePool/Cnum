t=10^-6;
g = @(x) cos(x);
x0=pi/4;
x1=g(x0);

while abs(x1-x0)>t
    x0=x1;
    x1=g(x0);
end

c=x1;