function M = binarise(X)
    minX = min(min(X));
    maxX = max(max(X));
    M = (X > (minX + (maxX - minX) * 0.5));
endfunction
