N=2400000;
    A=distributed.rand(1,N);
B=distributed.rand(1,N);
C=distributed.rand(1,N);
%sol=distributed.zeros(2,N);
tic
spmd 
   Al=getLocalPart(A);
   bl=getLocalPart(B);
   cl=getLocalPart(C);
   sol_loc=zeros(2,N/numlabs);
   for i=1:length(Al)
       sol_loc(:,i)=roots([Al(i),bl(i),cl(i)]);
   end
   dist=codistributor1d(2,[N/numlabs, N/numlabs, N/numlabs,N/numlabs,N/numlabs,N/numlabs],[2 N]);
   sol=codistributed.build(sol_loc,dist);
end
solg=gather(sol);
toc

