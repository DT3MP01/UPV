function A = lu_kji(A)
% Calcula la descomposición LU de A, en la versión kji, con sobreescritura 
% en la matriz A.
[m,n]=size(A);
for k=1:n-1
    if A(k,k)==0
        error('Encontrado pivote nulo')
    else
        for i=k+1:n
            A(i,k)=A(i,k)/A(k,k);
        end    
	    for j=k+1:n
             for i=k+1:n
                 A(i,j)=A(i,j)-A(i,k)*A(k,j);
             end
        end    
    end
end




