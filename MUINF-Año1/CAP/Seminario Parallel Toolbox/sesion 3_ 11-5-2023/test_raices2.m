N=80000
solf=distributed.zeros(2,N);
A=distributed.rand(1,N);B=distributed.rand(1,N);C=distributed.rand(1,N);
spmd 

   for i=drange(1:N)
        solf(:,i)=roots([A(1,i),B(1,i),C(1,i)]);
   end
end
 
sol=gather(solf);
 
