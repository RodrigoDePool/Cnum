%Dibujo del error segun el grando del interpolador en puntos equiespaciados
%en el ejemplo de Runge
f = @(x) 1./(1+x.*x);
xp = [ -5 : 10^-3 : 5];
E = zeros(1,30);
muda = 0;
while muda < 30
    muda = muda + 1;
    [ x , E(muda)] = pruebaInterpolacion(-5,5,f,xp,muda); 
end
plot(1:30,E);