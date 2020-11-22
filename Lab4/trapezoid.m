function r =trapezoid(a, b, f)
    %Se aplica la regla del trapezoide ((b-a)/2)*[f(a) + f(b)]
    aux=feval(f, a)+feval(f, b);
    r=((b-a)/2)*aux;
end