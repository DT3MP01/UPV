function [ imagen_out ] = traspon( imorig )
[m,n,tam]=size(imorig)
imagen_out=zeros(n,m,tam,'uint8');
for ind=1:tam
    for j=1:m
        for i=1:n
           imagen_out(i,j,ind)=imorig(j,i,ind);
        end
    end    
end
end
end
