function A = create_matrix_A(t, deg, n)
    A = zeros(n, deg);
    for i = 1:n
        for j=1:deg
            A(i,j)=t(i)^(j-1);
        end
    end
end