function [] = gaussian(A, B)
    # Class A

    muA = (1 / columns(A)) * sum(A,2);

    disp("muA:");
    disp(rats(muA));

    resA = 0;
    for i = 1:columns(A)
        resA += (A(:, i)) * (A(:, i))';
    endfor

    disp("Covariance matrix for class A:");
    covA = (1 / columns(A) * resA) - muA * muA';
    disp(rats(covA));
    disp('');
    disp("Inverse covariance matrix for class A:");
    invCovA = inv(covA);
    disp(rats(invCovA));

    # B

    muB = 1 / columns(B) * sum(B, 2);

    disp("muB:");
    disp(rats(muB));

    resB = 0;
    for i = 1:columns(B)
        resB += B(:, i) * B(:, i)';
    endfor

    disp("Covariance matrix for class B:");
    covB = (1 / columns(B) * resB) - muB * muB';
    disp(rats(covB));
    disp("Inverse covariance matrix for class B:");
    invCovB = inv(covB);
    disp(rats(invCovB));

    var = yes_or_no("\nDo you want to classify a point:\n");
    if var == 1
        x = input("\nWrite the point (as a vector): ");
        gAx = det(covA)^(-1/2) * exp(-1/2 * ((x - muA)' * invCovA * (x - muA)));
        disp(gAx);

        gBx = det(covB)^(-1/2) * exp(-1/2 * ((x - muB)' * invCovB * (x - muB)));
        disp(gBx);

        if gAx > gBx
            disp("\nI'm classified in class A!");
        else
            disp("\nI'm classified in class B!");
        endif
    else
        return
    endif

endfunction
