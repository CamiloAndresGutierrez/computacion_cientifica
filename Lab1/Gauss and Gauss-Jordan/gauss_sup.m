function X = gauss_sup(A, b, n)
    M = zeros([n n]);
    id = 1;
    while id <= n
        M(id,id) = 1;
        id=id+1;
    end
    idM = M;
    disp(M);
    i = n;
    while i >= 1
        x = A(i,i);
        j=i-1;
        while j >= 1
            M(j, i) = -1*(A(j,i)/x);
            j=j-1;
        end
        A = M*A;
        b = M*b;
        M = idM;
        i=i-1;
    end
    
    X = zeros([n 1]);
    X(1) = b(1)/A(1,1);
    i = 2;
    while i <=n
        j = 1;
        aux = 0;
        while j < i
            aux=aux+(A(i,j)*X(j));
            j=j+1;
        end
        X(i) = (b(i) - aux) / (A(i,i));
        i=i+1;
    end
    %disp(X);
end