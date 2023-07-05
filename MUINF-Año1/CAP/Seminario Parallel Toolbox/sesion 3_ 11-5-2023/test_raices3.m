N=80000
solf=distributed.zeros(2,N);
A=distributed.rand(1,N);B=distributed.rand(1,N);C=distributed.rand(1,N);
spmd 
 Al=getLocalPart(A);
 size(Al);
  Bl=getLocalPart(B);
   Cl=getLocalPart(C);
   nl=size(Al,2);
   sol_local=zeros(2,nl);
   for i=1:nl
        sol_local(:,i)=roots([Al(1,i),Bl(1,i),Cl(1,i)]);
   end
   solf=sol;
end
 
sol_global=gather(solf);
 
