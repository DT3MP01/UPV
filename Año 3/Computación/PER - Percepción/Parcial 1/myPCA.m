function [] = myPCA(M)
    disp("Let's calculate the PCA projection vectors of the set of samples:");
    disp("Mean:");
    myMean = mean(M);
    disp(myMean);
    disp("\nNormalised M:")
    normalisedM = M - myMean;
    disp(normalisedM)
    disp("\nCovariance matrix:");
    CM = 1 / rows(M) * (normalisedM' * normalisedM);
    disp(CM);
    disp("\nEigenvalues of the covariance matrix:");
    [eigenVectors, eigenValues] = eig(CM);
    [V, D] = sort(diag(eigenValues), "descend");
    V = round(100 * V) / 100;
    disp(V);
    disp("\nEigenvectors of the covariance matrix:");
    W = fliplr(eigenVectors);
    W = round(100 * W) / 100;
    disp(W)
    var = yes_or_no("\nDo you want to calculate now the projection to R^2?: ");

    if var == 1
        disp("\nThe eigenvectors of the two highest eigenvalues are:");
        r2vectors = W(:, [1, 2]);
        disp(r2vectors);
        disp("\nThe projection is:");

        for i = 1:rows(M)
            P(i, :) = r2vectors' * normalisedM(i, :)';
        endfor

        disp(P');
    else
        return;
    endif

endfunction
