function [] = multinomial_interpolation(X, epsilon)
    discount = 0;

    for i = 1:length(X)
        if X(i) - epsilon >= 0;
            X(i) = X(i) - epsilon;
            discount += X(i);
        else
            X(i) = 0;
            discount += X(i);
        endif
    endfor

    for i = 1:length(X)
        X(i) += discount / length(X);
    endfor

    disp("Interpolated vector:"), disp(rats(X));
    % toSum = (counter * epsilon) / zeroProbability;

    % # Looping over null parameters
    % for i = 1:length(X)
    %     X(i) = toSum;
    % endfor

    % disp('Interpolated vector is:'), disp(rats(X))
endfunction