function plotFunction(x, N)
    aux = 0:(N-1);
    it = 1;
    while it <= N
        aux(it) = 0;
        it = it+1;
    end
    plot(x, aux, 'x');
end