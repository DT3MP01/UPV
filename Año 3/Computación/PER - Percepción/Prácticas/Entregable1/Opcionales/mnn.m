function [V] = mnn(X,xl,m)
  N=rows(X);
  numbatches=ceil(N*N*4/1024^3)*4;
  V = [];

  if (numbatches<1) numbatches=1; end
    batchsize=ceil(N/numbatches);
   
  for i=1:numbatches
    % Building batches of test samples of batchsize
    Ybatch = X((i-1)*batchsize+1:min(i*batchsize,N),:);
    %printf("numbatches %f de %f \n",i,numbatches);
    % D is a distance matrix where training samples are by rows 
    % and test sample by columns
    D = L2dist(X,Ybatch);

    % Sorting descend per column from closest to farthest
    [D,idx] = sort(D,'ascend');

    % Indexes in the training set of m nearest neighbors of each test sample
    idx = idx(2:m+1,:);
    
    % Appending idx to the end
    V = [V, idx];
  endfor
endfunction
