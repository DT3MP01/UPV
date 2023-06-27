# Usage: kernel(Column vector, classes, numIter)
# Example: kernel(Column vector, [1 1 -1 1], numIter)

function [] = kernel(X, cn, numIter)
    # DEFINE Kernel in kernel.m
    disp("\nIMPORTANT: DEFINE Kernel in grammm.m\n");
    [gramm_M] = gramm(X);
    alpha = zeros(1, columns(cn));
    g = 0;

    for it = 1:numIter
        printf("\nIteration %d \n", it);

        for n = 1:columns(X)
            g = 0;

            for i = 1:columns(X)

                g = g + alpha(:, i) * cn(:, i) * gramm_M(n, i) + alpha(:, i) * cn(:, i);
            endfor

            if cn(:, n) * g <= 0
                alpha(:, n) = alpha(:, n) + 1;
                printf("x%d: g(x%d) = %d, c%d*g(x%d) = %d, error = YES, alpha =", n, n, g, n, n, cn(:, n) * g), disp(alpha);
            else
                printf("x%d: g(x%d) = %d, c%d*g(x%d) = %d, error = NO, alpha =", n, n, g, n, n, cn(:, n) * g), disp(alpha);
            endif

        endfor

    endfor

end
