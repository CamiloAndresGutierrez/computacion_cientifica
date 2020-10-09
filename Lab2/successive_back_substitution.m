function x = successive_back_substitution(A, b)
    [m,n]=size(A);
    x=zeros([n 1]);
    x(n)=b(n)/A(n,n);
    i=n;
    while i >= 1
        j = i+1;
        aux = 0;
        while j <= n
            aux=aux+(A(i,j)*x(j));
            j=j+1;
        end
        %se guarda la solución para x[i]
        x(i) = (b(i) - aux) / (A(i,i));
        i=i-1;
    end
end