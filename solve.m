function x=solve(A,b)
    
    [n,m]=size(A);
    [P,L,U]=gaussFact(A);
    b1=P*b';
    z=zeros(1,n);
    
    % Calcula z tal que Lz=Pb
    for i=1:n
        suma=0;
        for j=1:i-1
            suma=suma+z(j)*L(i,j);
        end
        z(i)=b1(i)-suma;
    end
    
    x=zeros(1,n);
    %Calcula x tal que Ux=z
    for k=0:n-1
        i=n-k;
        suma=0;
        for j=i+1:n
            suma=suma+x(j)*U(i,j);
        end
        
        x(i)=(z(i)-suma)/U(i,i);
    end

end
    