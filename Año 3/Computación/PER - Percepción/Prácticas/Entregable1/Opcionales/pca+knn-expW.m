#!/usr/bin/octave -qf

if (nargin!=5)
printf("Usage: pca+knn-expW.m <trdata> <trlabels> <ks> <%%trper> <%%dvper>\n")
exit(1);
end;

arg_list=argv();
trdata=arg_list{1};
trlabs=arg_list{2};
ks=str2num(arg_list{3});
trper=str2num(arg_list{4});
dvper=str2num(arg_list{5});

load(trdata);
load(trlabs);

N=rows(X);
rand("seed",23); permutation=randperm(N);
X=X(permutation,:); xl=xl(permutation,:);

Ntr=round(trper/100*N);
Ndv=round(dvper/100*N);
Xtr=X(1:Ntr,:); xltr=xl(1:Ntr);
Xdv=X(N-Ndv+1:N,:); xldv=xl(N-Ndv+1:N);

% printf(" Calculating indexes");
indexes = wilson(Xtr, xltr, 1);
% printf("Wilson indexes completed");

% Without PCA :
err = knn(Xtr(indexes,:), xltr(indexes,:), Xdv, xldv, 1); 
printf("Wilson sin PCA : %f \n",err)

% With PCA:
[m, W] = pca(Xtr(indexes,:)); 
errors = [];
for k = ks
    % Projecting to k dimensions
    XtrpK = (Xtr(indexes,:) - m)*W(:,1:k);
    XdvpK = (Xdv - m) * W(:, 1:k);
    err = knn(XtrpK, xltr(indexes,:), XdvpK, xldv, 1);
    printf("%d %f \n", k, err);
    errors = [errors; err];
endfor

errors = [ks', errors];
save pca+knn-exp.out errors;