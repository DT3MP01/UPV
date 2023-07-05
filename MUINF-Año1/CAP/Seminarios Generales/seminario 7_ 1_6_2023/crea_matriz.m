function A=crea_matriz(n, mu)
% Funci�n que genera la matriz A de coeficientes del problema.
% La matriz tendr� todos los elementos iguales a cero, salvo:
% 1) Los elementos de la diagonal principal que valdr�n 1+4*mu.
% 2) Las diagonales -n y n de A que valdr�n -mu.
% 3) Las diagonales -1 y 1 de A que valdr�n -mu, salvo en los siguientes 
%    puntos donde valdr�n 0:
%    3.1) La diagonal (-1) a la izquierda de la principal valdr� 0 en las 
%         filas 1, n+1, 2*n+1,..., (n-1)*n+1.
%    3.2) La diagonal (+1) a la derecha de la principal valdr� 0 en las 
%         filas n, 2*n,..., (n-1)*n.
A=zeros(n*n,n*n);
vd=ones(n*n,1)*(1+4*mu);
A=A+diag(vd);
vdi=-ones(n*n-1,1)*mu;
for i=n:n:n*n-1
    vdi(i)=0;
end
A=A+diag(vdi,1)+diag(vdi,-1);
vdd=-ones(n*n-n,1)*mu;
A=A+diag(vdd,-n)+diag(vdd,n);