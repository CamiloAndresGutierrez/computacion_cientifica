function A = create_matrix_A(t, deg, n)
    %Se inicializa la matriz A de tamaño n*deg, siendo n el tamaño del
    %vector t y deg siendo el grado del polinomio que queremos obtener
    A = zeros(n, deg);
    %Se hace el llenado de la matriz. Cada columna contiene el vector t 
    %elevado al grado i, siendo i = 0, 1, 2, 3, ..., n-1
    for i = 1:n
        for j=1:deg
            A(i,j)=t(i)^(j-1);
        end
    end
end