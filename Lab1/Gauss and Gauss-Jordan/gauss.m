function X = gauss(A, b, n)
    M = zeros([n n]);
    id = 1;
    while id <= n
        M(id,id) = 1;
        id=id+1;
    end
    idM = M;
    disp(M);
    i = 1;
    while i <= n
        x = A(i,i);
        j=i+1;
        while j <= n
            M(j, i) = -1*(A(j,i)/x);
            j=j+1;
        end
        A = M*A;
        b = M*b;
        M = idM;
        i=i+1;
    end
    
    X = zeros([n 1]);
    X(n) = b(n)/A(n,n);
    i = n-1;
    while i >= 1
        j = i+1;
        aux = 0;
        while j <= n
            aux=aux+(A(i,j)*X(j));
            j=j+1;
        end
        X(i) = (b(i) - aux) / (A(i,i));
        i=i-1;
    end
end
