function main()
B = 2;
t = 3;
L = -1;
U = 1;
p = properties_calculation(B, t, L, U);
x = solve(B, t, L, U, p(1));
plotFunction(x, p(1));
end