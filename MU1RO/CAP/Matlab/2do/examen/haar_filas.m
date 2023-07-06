function [ imagen_out ] = haar_filas( imorig )
[m,n]=size(imorig);
im_d=double(imorig);
imagen_out=zeros(m,n);
n2=n/2;
imagen_out =haar_filas_mex(im_d);
imagen_out=uint8(imagen_out);
end

