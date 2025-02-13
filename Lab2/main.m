function main
    %t = [-1.0, -0.5, 0.0, 0.5, 1.0, -1.5, -0.7, 0.3, 0.7, 1.8];
    %y = [1.0; 0.5; 0.0; 0.5; 2.0; 1.0; 0.5; 0.0; 0.5; 2.0];
    
    %%=================================================================
    %Datos históricos Futuros petróleo Brent%
    %https://es.investing.com/commodities/brent-oil-historical-data
%    Desde el 06/07/2020 hasta el 06/10/2020
    y=[43.1, 43.08, 43.29, 42.35, 43.24, 42.72, 42.9, 43.79, 43.37, 43.14, 43.28, 44.32, 44.29, 43.31, 43.34, 43.41, 43.22, 43.75, 42.94, 43.3, 44.15, 44.43, 45.17, 45.09, 44.4, 44.99, 44.5, 45.43, 44.96, 44.8, 45.37, 45.46, 45.37, 44.9, 44.35, 45.13, 45.86, 45.64, 45.09, 45.05, 45.28, 45.58, 44.43, 44.07, 42.66, 42.01, 39.78, 40.79, 40.06, 39.83, 39.61, 40.53, 42.22, 43.3, 43.15, 41.44, 41.72, 41.77, 41.94, 41.92, 42.43, 41.03, 40.95, 40.93, 39.27, 41.29, 42.18]';
    t=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67]';
%    =================================================================
    
    %%=================================================================
    %Esperanza de vida al nacer, total%
    %https://datos.bancomundial.org/indicator/SP.DYN.LE00.IN
    %Desde el el año 1964 hasta el 2018
%     y=[59.784, 60.257, 60.729, 61.201, 61.675, 62.152, 62.629, 63.105, 63.578, 64.047, 64.518, 64.994, 65.477, 65.964, 66.451, 66.926, 67.38, 67.802, 68.187, 68.529, 68.823, 69.065, 69.266, 69.436, 69.591, 69.75, 69.936, 70.161, 70.433, 70.752, 71.112, 71.497, 71.887, 72.264, 72.619, 72.945, 73.241, 73.517, 73.777, 74.026, 74.265, 74.5, 74.732, 74.962, 75.193, 75.424, 75.655, 75.882, 76.105, 76.322, 76.531, 76.732, 76.925, 77.109]';
%     t=[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54]';
    %=================================================================
    
    %Aquí se define el grado del polinomio para realizar las pruebas
    degree=5;
    
    %Se separan los valores de entrenamiento y de validación, los de 
    %entrenamiento van a ser los valores de las posiciones impares y los de
    %validación los valores de las posiciones pares.
    
    te=t(1:2:end);   %t de entrenamiento
    be=y(1:2:end);   %b de entrenamiento
    tv=t(2:2:end);   %t de validación
    bv=y(2:2:end);   %b de validación
    
    %Se crea la matriz A
    A = create_matrix_A(te, degree, length(te)); 
    
    %Se grafican los valores de entrenamiento y de validación
    plot(te, be, '.r', 'MarkerSize', 16);
    hold on
    grid on
    plot(tv, bv, '.b', 'MarkerSize', 16);
    hold on
    
    %Aquí definimos por cuál método queremos obtener el vector x
    tic
    x=ecuaciones_normales(A, be);
    %x=householder_method(A,be,length(te),degree);
    toc
    
    %Se crea un vector pe, que representa el polinomio con los valores de
    %entrenamiento, y luego se grafica este vector
    
    t2=linspace(min(t),max(t),100);
    pe=zeros(1,length(t2));
    for i=1:degree
        pe=pe+(x(i).*t2.^(i-1));
    end
    plot(t2,pe);
    legend("Entrenamiento", "Validación", "Polinomio");
    
    %Se crea un vector pv, que representa el polinomio con los valores de
    %validación y a partir de este, vamos a obtener el error, error medio y
    %desviación estándar del error
    
    pv=zeros(length(tv),1);
    for i=1:degree
        pv=pv+(x(i).*tv.^(i-1));
    end
    
    e=abs(pv-bv); %Error
    m_e=mean(e); %Error medio
    std_e=std(e);  %Desviación estándar del error
    disp(m_e);
    disp(std_e);
end