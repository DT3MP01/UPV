function [ imagen_out ] = difumina5( imorig )
%La imagen se guarda como un array tridimensional de enteros (uint8), R, G y B
% Esta función calcula el valor de cada pixel como la media de todos los
% pixeles vecinos y vuelve a guardarlo en variables de tipo uint8
[m,n,tam]=size(imorig)


im=double(imorig);
imagen_out=zeros(size(im),'uint8');


 function X = updatePicture(row, col,ind)
        % Take account of boundary effects
        rowU = max(1,row-1);  rowD = min(m,row+1);
        colL = max(1,col-1);  colR = min(n,col+1);
         aux=double((1.0/9.0)*(im(rowU,colL,ind)+im(rowU,col,ind)+im(rowU,colR,ind)+...
                 im(row,colL,ind)+im(row,col,ind)+im(row,colR,ind)+im(rowD,colL,ind)+...
                 im(rowD,col,ind)+im(rowD,colR,ind)));  
             aux=max(0,uint8(aux));
           X=min(255,aux);
    end



rows = gpuArray(1:m)';
cols = gpuArray(1:n);

for ind=1:tam
imagen_out(:,:,ind)=arrayfun(@updatePicture,rows,cols,ind);
end
end

