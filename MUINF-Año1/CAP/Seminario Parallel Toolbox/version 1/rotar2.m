function [ imagen_out ] = rotar2( imorig )
[m,n]=size(imorig);
imagen_out=zeros(n,m,'uint8');
    for j=1:m
        for i=1:n
           imagen_out(i,j)=imorig(m+1-j,n+1-i);
        end
    end    
end


