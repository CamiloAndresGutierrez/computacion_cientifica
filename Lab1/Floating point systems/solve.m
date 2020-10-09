function sol = solve(B, t, L, U, N)
    e = L;
    top = bitshift(1, (t-1));
    sol= 0:(N-1);
    it = 2;
    while e <= U
        val = 0;
        while val < top
            iter = 0;
            tmp = 0;
            while iter < t
                bit = bitand(val, bitshift(1, iter));
                iter = iter + 1;
                if bit
                    tmp = tmp + (1/(bitshift(1, iter)));
                end
            end
            tmp = (tmp+1)*(2^e);
            sol(it) = tmp;
            sol(it+1) = (-1)*tmp;
            it = it+2;
            val = val + 1;
        end
        e = e+1;
    end
end