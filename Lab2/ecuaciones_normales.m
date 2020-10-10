function x = ecuaciones_normales(A, b)
    %Se obtiene la matriz L transpuesta, que da como resultado de realizar
    %la descomposición de cholesky de la matriz cuadrada A_Transpuesta*A
    L_= chol(A.' * A);
    
    %Se multiplica AT*b
    A_Tb = A.'*b;
    %Se obtiene la matriz L a partir de L transpuesta
    L = L_.';
    %Se realiza la sustitución sucesiva hacia adelante para obtener el
    %valor del vector y de la ecuación Ly = AT*b
    y=successive_forward_substitution(L, A_Tb);
    %Se realiza la sustitución sucesiva hacia adelante para obtener el
    %valor del vector x de la ecuación LTx = y. A partir del y obtenido en
    %el llamado anterior
    x=successive_back_substitution(L_,y);
end