function r = properties_calculation(B, t, L, U)
    N = 2*(B-1)*(B^(t-1))*(U-L+1)+1;
    UFL = B^L;
    OFL = (B^(U+1))*(1-B^(-t));
    r = zeros([1 3]);
    r(1)=N;
    r(2)=UFL;
    r(3)=OFL;
end