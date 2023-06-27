# Usage:gramm(Column vectors)

function [r] = gramm(X)
    disp("\nIMPORTANT: UPDATE Kernel function\n");
    r = [];

    for i = 1:columns(X)

        for j = 1:columns(X)
            [aux] = kernel(X(:, i), X(:, j));
            r(i, j) = aux;
        endfor

    endfor

    format short;
    disp('Gramm matrix:'), disp(r);

end

function [k] = kernel(x, y)
    # example:k = x' * y / (norm(x) * norm(y));
    # Hamming distance = sum(xor(x,y))
    # Modulo = norm
    k = realpow(x' * y, 2);
end
