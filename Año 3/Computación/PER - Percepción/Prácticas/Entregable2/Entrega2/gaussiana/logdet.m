function [res]=logdet(X)
  lambda = eig(X);
  if (any(lambda<=0))
    res = log(realmin);
  else
    res = sum(log(lambda));
  end
end