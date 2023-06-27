function [edv] = bernoulli(Xtr, xltr, Xdv, xldv, epsilons)

    % Parameter binarisation
    Xdv = binarise(Xdv);
    Xtr = binarise(Xtr);

    % Prior probabilities
    priori_p = [];

    N = length(xltr);

    % Bernoulli parameters
    pcd = [];

    for i = unique(xltr)'
        % Indexes of elements with class i
        ind_i = find(xltr == i);
        nc = length(ind_i);

        % Calculating the probability of class i
        prob_c = nc / N;
        priori_p = [priori_p; prob_c];

        % Bernoulli parameter for class i
        Xtri = Xtr(ind_i, :);
        xn = sum(Xtri);
        
        pc = xn / nc;
        pcd = [pcd; pc];    
    end

    for e = epsilons
        % Smoothing with Simple truncation
        less_than_epsilon = pcd < e;
        more_than_epsilon = pcd > 1 - e;
        middle = pcd >= e & pcd <= 1 - e;

        pcd_smoothing = (less_than_epsilon * e) + middle .* pcd + (more_than_epsilon * (1 - e));

        wc = log(pcd_smoothing) - log(1 - pcd_smoothing);
        w0 = log(priori_p) + sum(log(1 - pcd_smoothing), 2);

        [_, i_max] = max(Xdv * wc' + w0', [], 2);
        i_max = i_max - 1;
        edv = mean(xldv != i_max) * 100;
    end

endfunction