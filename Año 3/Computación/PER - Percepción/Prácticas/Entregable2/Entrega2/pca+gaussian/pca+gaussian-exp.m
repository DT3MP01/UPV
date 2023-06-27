#!/usr/bin/octave -qf

if (nargin != 6)
  printf("Usage: gaussiana-exp.m <trdata> <trlabels> <alphas> <ks> <%%trper> <%%dvper>\n")
  exit(1);
end;

arg_list = argv();
trdata = arg_list{1};
trlabs = arg_list{2};
alphas = str2num(arg_list{3});
ks = str2num(arg_list{4});
trper = str2num(arg_list{5});
dvper = str2num(arg_list{6});


load(trdata);
load(trlabs);

N = rows(X);
rand("seed", 23); 
permutation = randperm(N);
X = X(permutation, :); 
xl = xl(permutation, :);
Ntr = round(trper / 100 * N);
Ndv = round(dvper / 100 * N);

Xtr = X(1:Ntr, :); 
xltr = xl(1:Ntr);
Xdv = X(N - Ndv + 1:N, :); 
xldv = xl(N - Ndv + 1:N);


[myMean W] = pca(Xtr);

Xtrm = Xtr - myMean;
Xdvm = Xdv - myMean;

result =[];


for a = alphas
    res_alpha =[]; 
    for k = ks
      XtrR = (Xtr - myMean) * W(:, 1:k);
      XdvR = (Xdv - myMean) * W(:, 1:k);
      [edv] = gaussian(XtrR, xltr, XdvR, xldv, a);
      res_alpha = [res_alpha;edv];
    end
    result = [result, res_alpha];
end
result =[ks',result];
save_precision(6);
save("pca+gaussian-exp.out", "result");