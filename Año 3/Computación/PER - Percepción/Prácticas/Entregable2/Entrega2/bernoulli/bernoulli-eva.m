#!/usr/bin/octave -qf

if (nargin !=  5)
    printf("Usage: bernoulli-exp.m <trdata> <trlabels> <tedata> <telabels> <epsilon>\n")
    exit(1);
end;

arg_list = argv();
trdata = arg_list{1};
trlabs = arg_list{2};
tedata = arg_list{3};
telabs = arg_list{4};
epsilon = str2num(arg_list{5});

load(trdata);
load(trlabs);
load(tedata);
load(telabs);

N = rows(X);
rand("seed", 23);
permutation = randperm(N);
X = X(permutation, :); 
xl = xl(permutation, :);

N = rows(Y);
rand("seed", 23); 
permutation = randperm(N);
Y = Y(permutation, :); 
yl = yl(permutation, :);

[edv] = bernoulli(X, xl, Y, yl, epsilon);
printf("\n %e %f", epsilon, edv);

