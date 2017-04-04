%f = @(x) x.^3+7*x;
f = @(x) log(x);
%Generamos numeros equiespaciados
nums = [1:0.5:10];
nums2 = [1:0.1:12];
p = interpoladorLagrange(nums2,nums,f(nums));
hold on;
plot(nums2,p);
pause(3);
fplot(f,[1,12])
