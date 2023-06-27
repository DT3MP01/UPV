function [X] = bernoulli(A, B)
    pA = sum(A, 2) / columns(A);
    pB = sum(B, 2) / columns(B);

    disp("pA = "), disp(rats(pA'));
    disp("pB = "), disp(rats(pB'));
    disp("p(A) = "), disp(rats(length(A) / (length(A) + length(B))))
    disp("p(B) = "), disp(rats(length(B) / (length(A) + length(B))))