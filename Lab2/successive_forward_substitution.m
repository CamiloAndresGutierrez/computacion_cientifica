function x = successive_forward_substitution(A, b)
    %Esta es la función que resuelve la ecuación Ax=b para una matriz
    %triangular inferior
    [m,n]=size(A);
    %Se inicializa el vector x 
    x=zeros([n 1]);
    %El caso base de esta función es que en la primera posición del vector 
    %x se ubica el valor de b[1]/A[1][1]
    x(1)=b(1)/A(1,1);
    %Se itera desde i hasta n, siendo i=2,...,n y en cada posición de
    %x se guarda el valor de dividir (b[i]-sumatoria) / A[i][i]
    for i=2:n
        aux=0;
        %Se realizar la sumatoria desde j hasta i-1, siendo j=1,..., i-1 de
        %A[i][i]*x[j]
        for j=1:(i-1)
            aux=aux+A(i,j)*x(j);
        end
        %se guarda la solución para x[i]
        x(i)= (b(i)-aux)/A(i,i);
    end
end