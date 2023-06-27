function [] = gauss_flat_smoothing(covA, covB, alpha)
    flatted_covA = alpha * covA + (1 - alpha) * eye(length(covA));
    flatted_covB = alpha * covB + (1 - alpha) * eye(length(covB));

    disp(rats(flatted_covA));
    disp('');
    disp(rats(flatted_covB));
