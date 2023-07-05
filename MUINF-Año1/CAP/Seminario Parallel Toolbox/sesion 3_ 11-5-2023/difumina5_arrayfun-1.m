function [ imagen_out ] = difumina5_arrayfun( imorig )
%La imagen se guarda como un array tridimensional de enteros (uint8), R, G y B
% Esta función calcula el valor de cada pixel como la media de todos los
% pixeles vecinos y vuelve a guardarlo en variables de tipo uint8
[M,N,tam]=size(imorig);
im=gpuArray(double(imorig));

rows=gpuArray((1:M)');
cols=gpuArray(1:N);
imagen_out=gpuArray.zeros(size(im),'uint8');
    function X=funaux(row,col,ind)
        rowU = max(1,row-1);  rowD = min(M,row+1);
        colL = max(1,col-1);  colR = min(N,col+1);    
        aux= double((1.0/5.0)*(im(rowU,col,ind)+im(row,colL,ind)+...
            im(row,col,ind)+im(row,colR,ind)+im(rowD,col,ind)));
        X=max(0,uint8(aux));
    end
for i=1:3
imagen_out(:,:,i)=arrayfun(@funaux,rows,cols,i);
end
% for ind=1:tam
%     for j=2:auxj
%         for i=2:auxi
%            aux=double((1.0/9.0)*(im(i-1,j-1,ind)+im(i-1,j,ind)+im(i-1,j+1,ind)+...
%                  im(i,j-1,ind)+im(i,j,ind)+im(i,j+1,ind)+im(i+1,j-1,ind)+...
%                  im(i+1,j,ind)+im(i+1,j+1,ind)));  
%              aux=max(0,uint8(aux));
%            imagen_out(i,j,ind)=min(255,aux);
%         end
%     end    
% end
end

