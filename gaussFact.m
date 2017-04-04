function [P,L,U]=gaussFact(A)
   
    [n,m]=size(A);
    
    U=A;
    L=eye(n);
    P=eye(n);
    
    for k=1:n-1
        [m,l]=max(abs(U(k:n,k)));
        iestr=l+k-1;
        
        if(iestr~=k)
            %% Permutacion de U
            v=U(iestr, k:n);
            U(iestr, k:n)=U(k,k:n);
            U(k, k:n)=v;
            %% Permutacion de L
            v=L(iestr,1:k-1);
            L(iestr,1:k-1)=L(k,1:k-1);
            L(k,1:k-1)=v;
            %% Permutacion de P
            v=P(iestr,:);
            P(iestr,:)=P(k,:);
            P(k,:)=v;
        end
        
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