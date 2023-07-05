function b = solve_tril_unidad(A,b)
% Resuelve un sistema Ax=b, siendo A una matriz triangular inferior unidad,
% con sobreescritura en el vector b.
[m,n]=size(A);
for i=1:n
    for j=1:i-1
        b(i)=b(i)-A(i,j)*b(j); 
    end
    % No es necesario dividir por L(i,i) porque vale 1
end

