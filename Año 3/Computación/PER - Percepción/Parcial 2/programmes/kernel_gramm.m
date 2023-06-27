# Example:kernel_gramm(Gramm matrix, [1 1 1 2 2 2 2], numIter)

function [] = kernel_gramm(gramm, cn, numIter)
    alpha = zeros(1, columns(cn));
    g = 0;

    for it = 1:numIter
        printf("Iteration %d \n", it)

        for n = 1:columns(gramm)
            g = 0;
            for i = 1:columns(gramm)
                g = g + alpha(:, i) * cn(:, i) * gramm(i, n) + alpha(:, i) * cn(:, i);
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
