function r = backwards_derivative(f, h, x_)
    %Se aplica la fórmula de la derivada (f(x) - f(x-h))/h
    r = (feval(f, x_) - feval(f,x_ - h))/h;
end