function x = ecuaciones_normales(A, b)
    L_= chol(A.' * A);
    A_TP = A.'*b;
    L = L_.';
    
    y=successive_forward_substitution(L, A_TP);
    x=successive_back_substitution(L_,y);
end