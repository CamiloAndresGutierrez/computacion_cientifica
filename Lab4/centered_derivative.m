function r = centered_derivative(f, h, x_)
    %Se aplica la fórmula de la derivada (f(x+h) - f(x-h))/2*h
    r = (feval(f, x_ + h) - feval(f,x_ - h))/(2*h);

end