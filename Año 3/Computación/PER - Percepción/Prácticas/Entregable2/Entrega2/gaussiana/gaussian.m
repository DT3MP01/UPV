function [edv] = gaussian(Xtr,xltr,Xdv,xldv,alphas)
  N = rows(Xtr);

  cl = unique(xltr);
  for c = 1:length(cl)
    cRows = find(cl(c) == xltr);
    Xtrc = Xtr(cRows, :);
    NC = rows(Xtrc);
    pc(c) = NC / N;
    mu(:, c) = sum(Xtrc) / NC;
    covMatrix{c} = cov(Xtrc, 1);
  end

  % Flat smoothing
  for a = 1:length(alphas)
    alpha = alphas(a);
    for c = 1:length(cl)
      sigma{c} = alpha * covMatrix{c} + (1 - alpha) * eye(rows(covMatrix{c}));
    end

    for c = 1:length(cl)
      classifier(:, c) = gc(pc(c), mu(:, c), sigma{c}, Xdv);
    end

    [_, maxIndex] = max(classifier, [], 2);
    maxIndex = maxIndex - 1;
    errors = (maxIndex != xldv);
    [nr, _] = size(xldv);
    edv(a) = sum(errors) / nr * 100;
  end
end
