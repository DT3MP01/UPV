function [m, W] = pca(X)
  # Calculating the mean m of the training data X
  m = mean(X);
  # Subtracting the mean from all training data to obtain Xm
  Xm = X - m;
  # Calculating the covariance matrix
  CM = (Xm' * Xm) / rows(X);
  # Calculating eigenvalues and eigenvectors (eig)
  [eigenvectors, eigenvalues] = eig(CM);
  # Sorting eigenvectors with sort method
  [_, Index] = sort(diag(eigenvalues), "descend");
  # Weight matrix
  W = eigenvectors(:,Index);
  
end
