function main
    % ==============Derivadas================ %
    n=100000;
    x_values=linspace(-10,10,n);
    
%     h=0.001;
%     %Input 1 derivada
%     f=@(x) 3*x^3 + 2*x^2;
%     f_real=@(x) 9*x^2 + 4*x;
%     %Input 2 derivada
%     f=@(x) exp(-x^2);
%     f_real=@(x) (-2*x)*exp(-x^2);
%     %Input 3 derivada
%     f=@(x) sin(2*x^2);
%     f_real=@(x) cos(2*x^2)*4*x;
%     
%     %Se realizan las derivadas hacia adelante, hacia atrás y centrada.
%     f_aprox=zeros([1 n]);
%     tic
%     for i=1:n
%         f_aprox(i)=derivative(f, h, x_values(i));
%     end
%     toc
%     
%     tic
%     f_aprox1=zeros([1 n]);
%     for i=1:n
%         f_aprox1(i)=backwards_derivative(f, h, x_values(i));
%     end
%     toc
%     
%     tic
%     f_aprox2=zeros([1 n]);
%     for i=1:n
%         f_aprox2(i)=centered_derivative(f, h, x_values(i));
%     end
%     toc
%     
%     %Se evalúa la derivada analítica
%     f_c=zeros([1 n]);
%     for i=1:n
%         f_c(i)=feval(f_real,x_values(i));
%     end
%     
%     %Se grafican las derivadas aproximadas y la analítica
%     plot(x_values, f_aprox, "g");
%     hold on;
%     plot(x_values, f_aprox1, "b");
%     hold on;
%     plot(x_values, f_aprox2, "r");
%     hold on;
%     plot(x_values, f_c, "k");
%     legend("Derivada adelante", "Derivada atrás", "Derivada centrada", "Derivada analítica");
% %     legend("Derivada atrás", "Derivada analítica");
% %     legend("Derivada central", "Derivada analítica");
%     
%     %Se sacan los errores de las derivadas con la fórmula |Vreal - Vaprox|
%     e1=abs(f_aprox - f_c); %Error de la derivada hacia adelante
%     e2=abs(f_aprox1 - f_c); %Error de la derivada hacia atrás
%     e3=abs(f_aprox2 - f_c); %Error de la derivada centrada
%     
%     %Se sacan los errores medios de las derivadas.
%     m_e1=mean(e1); %Error medio de la derivada hacia adelante
%     disp("Error medio derivada hacia adelante = " + m_e1);
%     m_e2=mean(e2); %Error medio de la derivada hacia atrás
%     disp("Error medio derivada hacia atrás = " + m_e2);
%     m_e3=mean(e3); %Error medio de la derivada centrada
%     disp("Error medio derivada centrada = " + m_e3);
%     
%     %Se sacan las desviaciones estándares de los errores de las derivadas.
%     std_e1=std(e1);  %Desviación estándar del error de la derivada hacia adelante
%     disp("Desviación estándar de la derivada hacia adelante = " + std_e1);
%     std_e2=std(e2);  %Desviación estándar del error de la derivada hacia atrás
%     disp("Desviación estándar de la derivada hacia atrás = " + std_e2);
%     std_e3=std(e3);  %Desviación estándar del error de la derivada centrada
%     disp("Desviación estándar de la derivada centrada = " + std_e3);
%     
%     %Se saca la exactitud de cada método
%     accuracy1= e1/f_aprox; %exactitud de la derivada hacia adelante
%     disp("Exactitud de la derivada hacia adelante = " + accuracy1);
%     accuracy2= e2/f_aprox1; %exactitud de la derivada hacia atrás
%     disp("Exactitud de la derivada hacia atrás = " + accuracy2);
%     accuracy3= e3/f_aprox2; %exactitud de la derivada centrada
%     disp("Exactitud de la derivada centrada = " + accuracy3);
%     
    % ==============Integrales================ %
%     %Input 1 integral
%     f = @(x) sin(x.^2);
%     r = integral(f, -10, 10);
%     Input 2 integral
%     f = @(x) sqrt(1+x.^4);
%     r = integral(f, -10, 10);
%     Input 3 integral
    f = @(x) (x.^x);
    r = integral(f, -10, 10);
%     
    disp("Analitica_matlab " + r);
    
    f_calc=0;
    tic
    for i=2:n
        f_calc=f_calc + midpoint(x_values(i-1), x_values(i), f);
    end
    toc
    disp("Midpoint " + f_calc);
    
    f_calc1=0;
    tic
    for i=2:n
        f_calc1=f_calc1 + trapezoid(x_values(i-1), x_values(i), f);
    end
    toc
    disp("Trapezoid " + f_calc1);
    
    f_calc2=0;
    tic
    for i=2:n
        f_calc2=f_calc2 + simpson(x_values(i-1), x_values(i), f);
    end
    toc
    disp("Simpson " + f_calc2);
    
    e_1=abs(f_calc - r); %Error del método por regla del punto medio
    disp("Error absoluto por regla del punto medio = " + e_1);
    e_2=abs(f_calc1 - r); %Error del método por regla del trapezoide
    disp("Error absoluto por regla del trapezoide = " + e_2);
    e_3=abs(f_calc2 - r); %Error del método por regla de Simpson
    disp("Error absoluto por regla de Simpson = " + e_3);
    
    accuracy1= e_1/f_calc; %exactitud del método por regla del punto medio
    disp("Exactitud por regla del punto medio = " + accuracy1);
    accuracy2= e_2/f_calc1; %exactitud del método por regla del trapezoide
    disp("Exactitud por regla del trapezoide = " + accuracy2);
    accuracy3= e_3/f_calc2; %exactitud del método por regla de Simpson
    disp("Exactitud por regla de Simpson = " + accuracy3);
end