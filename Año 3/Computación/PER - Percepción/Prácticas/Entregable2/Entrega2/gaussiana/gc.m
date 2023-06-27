function [res]=gc(pc,mu,sigma,X)
  pc=log(pc)-1/2*logdet(sigma)-1/2*(mu')*pinv(sigma)*mu;
  wc=pinv(sigma)*mu;
  wC=-1/2*pinv(sigma);
  res = sum((X*wC).*X,2) + X*wc + pc;
end