function r = derivative(f, h, x_)
    %Se aplica la fórmula de la derivada hacia adelante (f(x+h) - f(x))/h
    r = (feval(f,x_+h) - feval(f, x_))/h;
end