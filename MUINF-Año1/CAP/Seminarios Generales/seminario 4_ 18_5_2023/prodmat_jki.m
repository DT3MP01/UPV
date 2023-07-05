function C=prodmat_jki(A,B)
[m,n]=size(A);
[n,p]=size(B);
C=zeros(m,p);
for j=1:p
    for k=1:n
        for i=1:m
            C(i,j)=C(i,j)+A(i,k)*B(k,j);
        end
    end
end