function x=householder_method(A,b,n,deg)
    x=zeros([deg 1]);
    %Ciclo que recorre todas las columnas de la matriz A
    for i=1:deg
        %creación del vector e que representa un vector de la matriz
        %identidad
        e=zeros([n 1]);
        e(i,1)=1;
        %Se extrae una de las columnas de la matriz A
        a=A(:,i);
        %Ciclo para eliminar los valores que hay antes del pivote
        j=1;
        while j<i
            a(j,1)=0;
            j=j+1;
        end
        %Se saca la norma del vector extraído de la matriz A
        alpha=norm(a);
        %Se multiplica alpha por el vector e
        a_e=alpha*e;
        %Se pone el signo contrario al del pivote del vector a
        if a(i,1)>0
            a_e=a_e*(-1);
        end
        %Se crea el vector v.
        v=a-a_e;
        %Se crea un escalar a partir del vector v y su transpuesta.
        aux=(v.')*(v);
        %Se crea la matriz H
        H=eye(n)-(2/aux)*((v)*(v.'));
        %Se multiplica H*A y H*b
        A=H*A;
        b=H*b;
    end
    %Se realiza la sustitución sucesiva hacia adelante para obtener el
    %valor de la ecuación Ax=b
    x=successive_back_substitution(A, b);
end