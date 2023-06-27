function [] = multinomial_backoff(X, epsilon)
    counter = 0;
    zeroProbability = 0;

    # Looping over non-null parameters
    for i = 1:length(X)
        if X(i) > 0
            X(i) -= epsilon;
            counter += 1;
        else
            ++zeroProbability;
        endif
    endfor
    
    toSum = (counter * epsilon) / zeroProbability;

    # Looping over null parameters
    for i = 1:length(X)
        if X(i) == 0
            X(i) = toSum;
        endif
    endfor

    disp('Back-off vector is:'), disp(rats(X))
endfunction