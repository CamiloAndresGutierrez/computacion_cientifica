function r=simpson(a, b, f)
    %Se aplica la regla de simpson ((b-a)/6)*[f(a) + 4*f((a+b)/2) + f(b)]
    aux = feval(f, a) + 4*feval(f, (a+b)/2) + feval(f,b);
    r = ((b-a)/6)*aux;
end