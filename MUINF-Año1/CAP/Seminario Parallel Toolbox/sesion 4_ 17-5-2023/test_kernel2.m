N=5000;A=rand(N,1);B=rand(N,1);C=rand(N,1);
tic
Ag=gpuArray(A);
Bg=gpuArray(B);
Cg=gpuArray(C);
solre=zeros(N,1);
solim=zeros(N,1);
solreg=gpuArray(solre);
solimg=gpuArray(solim);

kern=parallel.gpu.CUDAKernel('ecuacion2.ptx','ecuacion2.cu');
kern.ThreadBlockSize=512;
kern.GridSize=[ceil(N/512),1]

[solreg,solimg]=feval(kern,solreg,solimg,Ag,Bg,Cg,N);

gather(solreg)
gather(solimg)

