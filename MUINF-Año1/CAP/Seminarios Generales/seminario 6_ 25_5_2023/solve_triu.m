function b = solve_triu(A,b)
% Resuelve un sistema Ax=b, siendo A una matriz triangular superior, con
% sobreescritura en el vector b.
[m,n]=size(A);
for i=n:-1:1
    for j=i+1:n
        b(i)=b(i)-A(i,j)*b(j);
    end
    b(i)=b(i)/A(i,i);
end

