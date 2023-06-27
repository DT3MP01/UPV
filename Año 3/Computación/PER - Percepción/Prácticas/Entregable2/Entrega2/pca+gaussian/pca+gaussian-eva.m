#!/usr/bin/octave -qf

if (nargin != 6)
    printf("Usage: pca+gaussian-eva.m <trdata> <trlabels> <tedata> <telabels> <alpha> <k>\n")
    exit(1);
end;

arg_list = argv();
trdata = arg_list{1};
trlabs = arg_list{2};
tedata = arg_list{3};
telabs = arg_list{4};
alpha = str2num(arg_list{5});
k = str2num(arg_list{6});

load(trdata);
load(trlabs);
load(tedata);
load(telabs);

N = rows(X);
rand("seed", 23); 
permutation = randperm(N);
X = X(permutation, :);
xl = xl(permutation, :);

[myMean W] = pca(X);

XtrR = (X - myMean) * W(:, 1:k);
XdvR = (Y - myMean) * W(:, 1:k);
[edv] = gaussian(XtrR, xl, XdvR, yl, alpha);
printf("alpha (%.1e) , K (%d) = %f\n", alpha, k, edv);
