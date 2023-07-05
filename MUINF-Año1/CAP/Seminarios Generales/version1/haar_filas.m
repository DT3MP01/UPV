function [ imagen_out ] = haar_filas( imorig )
[m,n]=size(imorig);
im_d=double(imorig);
imagen_out=zeros(m,n);
n2=n/2;
for i=1:m
    jaux=1;
    for j=1:2:n
        imagen_out(i,jaux)=(im_d(i,j)+im_d(i,j+1))/2;
        imagen_out(i,jaux+n2)=(im_d(i,j)-im_d(i,j+1))/2;
        jaux=jaux+1;
    end
end
imagen_out=uint8(imagen_out);
end


