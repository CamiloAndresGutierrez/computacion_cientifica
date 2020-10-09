function r = singular(A, b, n)
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
    
    i = 1;
    ran = n;
    while i <= n
        j = 1;
        flag = 0;
        while j <= n
            if A(i, j) == 0
                flag = flag + 1;
            end
            j=j+1;
        end
        if flag == n
            ran = ran-1;
        end
        i=i+1;
    end
    
    r = 1;
    if det(A) ~= 0 && ran == n
        r = 0;
    end
end