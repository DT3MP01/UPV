# source 4_2_1.m
# load train - labels - idx1 - ubyte.mat.gz
# load train - images - idx3 - ubyte.mat.gz

# 4.2.1

labs = unique(xl); # To obtain the number of classes

for c = labs'
    indexC = find(xl == c); # Obtains all the rows that xl = c
    xc = X(indexC, :); # Obtains all the columns indexC
    mXc = sum(xc) / rows(xc);
    matrix(:, c + 1) = mXc';
end

# 5.0

function cstar = linmach(w, x)
    C = columns(w);
    cstar = 1;
    max = -inf;
    g = x' * w;
    [_, cstar] = max(g);
endfunction

# 5.1
