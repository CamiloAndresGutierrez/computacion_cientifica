function x = successive_back_substitution(A, b)
    %Esta es la función que resuelve la ecuación Ax=b para una matriz
    %triangular superior
    [m,n]=size(A);
    %Se inicializa el vector x 
    x=zeros([n 1]);
    %El caso base de esta función es que en la última posición del vector x
    %se ubica el valor de b[n]/A[n][n]
    x(n)=b(n)/A(n,n);
    %Se itera desde i hasta 1, siendo i=n-1, ..., 1 y en cada posición de
    %x se guarda el valor de dividir (b[i]-sumatoria) / A[i][i]
    i=n;
    while i >= 1
        j = i+1;
        aux = 0;
        %Se realizar la sumatoria desde j hasta n, siendo j=i+1, ..., n de
        %A[i][i]*x[j]
        while j <= n
            aux=aux+(A(i,j)*x(j));
            j=j+1;
        end
        %se guarda la solución para x[i]
        x(i) = (b(i) - aux) / (A(i,i));
        i=i-1;
    end
end