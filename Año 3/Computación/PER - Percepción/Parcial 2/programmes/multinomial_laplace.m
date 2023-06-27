function [] = multinomial_laplace(X, epsilon)
    for i = 1:length(X)
        X(i) += epsilon;
    endfor

    mySum = sum(X);   

    for i = 1:length(X)
        X(i) = X(i) / mySum;
    endfor


    disp('Laplace normalised vector is:'), disp(rats(X))
endfunction