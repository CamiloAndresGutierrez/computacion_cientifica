function X = gauss_jordan(A, b, n)
    M = zeros([n n]);
    id = 1;
    while id <= n
        M(id,id) = 1;
        id=id+1;
    end
    A_p = M;
    idM = M;
    i = 1;
    while i <= n
        x = A(i,i);
        j=1;
        while j <= n
            if j ~= i
                M(j, i) = -1*(A(j,i)/x);
            end
            j=j+1;
        end
        A = M*A;
        A_p = M*A_p;
        M = idM;
        i=i+1;
    end
    
    i = 1;
    while i <= n
        j = 1;
        while j <= n
            A_p(i,j) = A_p(i,j)/A(i,i);
            j = j+1;
        end
        i=i+1;
    end
    X = A_p*b;
    disp(X);
    
end