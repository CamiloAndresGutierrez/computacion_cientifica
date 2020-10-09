function x = successive_forward_substitution(A, b)
    [m,n]=size(A);
    x=zeros([n 1]);
    x(1)=b(1)/A(1,1);
    for i=2:n
        aux=0;
        for j=1:(i-1)
            aux=aux+A(i,j)*x(j);
        end
        x(i)= (b(i)-aux)/A(i,i);
    end
end