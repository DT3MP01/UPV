function [X] = gaussian_classifier3(muA, covA, muB, covB, muC, covC, x)
    invCovA = inv(covA);
    invCovB = inv(covB);
    invCovC = inv(covC);

    gAx = det(covA)^(-1/2) * exp(-1/2 * ((x - muA)' * invCovA * (x - muA)));
    printf("\ngA(x) = %d", gAx);

    gBx = det(covB)^(-1/2) * exp(-1/2 * ((x - muB)' * invCovB * (x - muB)));
    printf("\ngB(x) = %d\n", gBx);

    gCx = det(covC)^(-1/2) * exp(-1/2 * ((x - muC)' * invCovB * (x - muC)));
    printf("gC(x) = %d\n", gCx);

    if gAx > gBx

        if gAx > gCx
            disp("\nI'm classified in class A!");
        endif

    endif

    if gBx > gAx

        if gBx > gCx
            disp("\nI'm classified in class B!");
        endif

    endif

    if gCx > gAx

        if gCx > gBx
            disp("\nI'm classified in class C!");
        endif

    endif

endfunction
