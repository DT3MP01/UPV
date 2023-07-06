function [ imagen_out ] = traspon_arrayfun( imorig )
[m,n,tam]=size(imorig)
imagen_out=zeros(n,m,tam,'uint8');


function imagen_out =  trasPicture(i,j,ind)
     imagen_out=imorig(j,i,ind);
end

i = gpuArray(1:m)';
j = gpuArray(1:n);

for ind=1:tam
   imagen_out(:,:,ind)=arrayfun(@trasPicture,i,j,ind);
end

end