# Usage: bernoulli_simple(Probabilities per column, epsilon)

function [X] = bernoulli_simple(X, epsilon)
    for i = 1:rows(X)
        for j = 1:columns(X)
            if X(i, j) < epsilon
                X(i, j) = epsilon;
            elseif X(i, j) > 1 - epsilon
                X(i, j) = 1 - epsilon;
            endif
        endfor
    endfor
endfunction