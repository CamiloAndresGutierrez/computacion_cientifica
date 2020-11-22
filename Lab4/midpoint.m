function r = midpoint(a, b, f)
    %Se aplica la regla de punto medio (b-a)*f((a+b)/2)
    aux = feval(f, (a+b)/2);
    r = (b-a)*aux;

end