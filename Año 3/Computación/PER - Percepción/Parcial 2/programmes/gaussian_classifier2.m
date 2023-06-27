function [X] = gaussian_classifier2(muA, covA, muB, covB, x)
        invCovA = inv(covA);
        invCovB = inv(covB);
        
        gAx = det(covA)^(-1/2) * exp(-1/2 * ((x - muA)' * invCovA * (x - muA)));
        printf("\ngA(x) = %d", gAx);

        gBx = det(covB)^(-1/2) * exp(-1/2 * ((x - muB)' * invCovB * (x - muB)));
        printf("\ngB(x) = %d\n", gBx);

        if gAx > gBx
            disp("\nI'm classified in class A!");
        else
            disp("\nI'm classified in class B!");
        endif