function [c] = knnV(V,ind,xl,k)
  % Obtaining the existing indexes from the matrix of indexes
  indexes = V(ismember(V,ind));
  % Taking the first k indexes
  indexes = indexes(1:k);
  % Getting the ArgMax of the class
  c = mode(xl(indexes),1);
endfunction
