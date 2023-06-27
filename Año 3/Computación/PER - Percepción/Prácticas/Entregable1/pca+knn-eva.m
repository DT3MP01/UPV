#!/usr/bin/octave -qf

if (nargin!=5)
printf("Usage: pca+knn-eva.m <trdata> <trlabels> <tedata> <telabels> <k>\n")
exit(1);
end;

arg_list=argv();
trdata=arg_list{1};
trlabs=arg_list{2};
tedata=arg_list{3};
telabs=arg_list{4};
k=str2num(arg_list{5});

load(trdata);
load(trlabs);
load(tedata);
load(telabs);

N=rows(X);
rand("seed",23); permutation=randperm(N);
X=X(permutation,:); xl=xl(permutation,:);

% PCA:
[media W] = pca(X);

% Projecting to k dimensions
XtrpK = (X - media)*W(:,1:k);
XdvpK = (Y - media)*W(:,1:k);

err = knn(XtrpK, xl, XdvpK, yl, 1);
printf("Error with PCA: %f \n",err);

% Without PCA:
errOg = knn(X, xl, Y, yl, 1);
printf("Error without PCA: %f \n",errOg);