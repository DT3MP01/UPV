N=80000
solf=zeros(N,2);
spmd 
    trozo=N/numlabs;
    sol=zeros(trozo,2); %generamos dentro sol, A,B,C
     A=rand(trozo,1);B=rand(trozo,1);C=rand(trozo,1);  
    ini=(labindex-1)*trozo+1;
    fin=labindex*trozo;
   for i=1:trozo
        sol(i,:)=roots([A(i,1),B(i,1),C(i,1)]);
   end
end
 
for i=1:numel(ini)
   init=ini{i};
  fint=fin{i};
  %aux=sol{i};
  solf(init:fint,1:2)=sol{i};
end 
 
