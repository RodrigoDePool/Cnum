function [c,n,r]=bisec(f,a,b,t)
    n=0;
    if(f(a)*f(b)>0)
        return;
    elseif(f(a)==0)
        c=a;
        r=0;
        return;
    elseif(f(b)==0)
        c=b;
        r=0;
        return;
    end;
    c=(a+b)/2;
    r=f(c);
    n=1;
    if(t>0)
        flag=0;
        cond=t;
    else
        flag=1;
        cond=c*2^-50;
    end
    while(abs(b-a)>cond)
        if(f(c)==0)
            return;
        elseif(f(a)*f(c)<0)
            b=c;
        else
            a=c;
        end;
        c=(a+b)/2;
        r=f(c);
        n=n+1;
        if(flag==1)
            cond=c*2^-50;
        end
    end;
       
    return;
        
        
    
