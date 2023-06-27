#!/usr/bin/octave -qf

if (nargin!=5)
printf("Usage: pca+knn-evaW.m <trdata> <trlabels> <tedata> <telabels> <k>\n")
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




indexes = wilson(X, xl, 1);

% PCA:
[myMean, W] = pca(X(indexes,:));

% Projecting to k dimensions
XtrpK = (X(indexes,:) - myMean)*W(:,1:k);
XdvpK = (Y - myMean)*W(:,1:k);

err = knn(XtrpK, xl(indexes), XdvpK, yl, 1);
printf("Error with PCA: %f \n",err);


% Without PCA:
errOg = knn(X(indexes,:), xl(indexes), Y, yl, 1);
printf("Error without PCA: %f \n",errOg);