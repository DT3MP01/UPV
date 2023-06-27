# Usage adaboost(Column vectors, List of the classes belonging to the samples, number of "g" functions)
# 2019r exam example: adaboost(M, [1 -1 1 -1], 4)
# IMPORTANT: Update "G" functions

function [] = adaboost(M, xl, g)
    disp("\nIMPORTANT: UPDATE 'g' functions\n");
    HF = zeros(columns(M), g);
    w = ones(1, 4) / g;

    for iter = 1:3
        printf("\nITERATION  %d\n", iter);
        printf("\nWeigths of iteration: %d\n", iter), disp(rats(w));

        for i = 1:columns(M)
            sample = M(:, i);

            for j = 1:g
                ter = gi(sample, j);

                if (ter == xl(i))
                    HF(i, j) = 1;
                endif

            endfor

        endfor

        antiHF = xor(ones(columns(M), g), HF);
        classificationError = w * antiHF;
        disp("Weighted classification error:"), disp(rats(classificationError));

        [minError, ci] = min(classificationError);

        printf("\nC%d = g%d \n", iter, ci);
        printf("Error of iteration %d:", iter);
        disp(rats(minError));

        alpha = 1/2 * log((1 - minError) / minError);
        printf("Alpha = %d\n", alpha);

        processingWeights = [];

        for i = 1:columns(M)
            sample = M(:, i);
            ter = gi(sample, ci);
            aux = w(i) * exp(-alpha * xl(i) * ter);
            processingWeights = [processingWeights; aux];
        endfor

        printf("w^(%d) * exp(-ci * alpha%d * C%d(Xi)):\n", iter, iter, iter);
        disp(processingWeights);
        w = processingWeights' / sum(processingWeights);

    endfor

    disp("\nHit/fail table:");
    disp(HF);

    function [x] = gi(z, j)

        if j == 1

            if z(1, 1) > 0
                x = 1;
            else
                x = -1;
            endif

        elseif j == 2

            if z(2, 1) > -1
                x = 1;
            else
                x = -1;
            endif

        elseif j == 3

            if z(3, 1) > 1
                x = 1;
            else
                x = -1;
            endif

        elseif j == 4

            if z(1, 1) + z(2, 1) + z(3, 1) >= 0
                x = 1;
            else
                x = -1;
            endif

        endif

    endfunction

endfunction
