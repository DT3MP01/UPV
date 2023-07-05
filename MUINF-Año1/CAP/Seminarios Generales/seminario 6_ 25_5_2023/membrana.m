function membrana(n,opcion)
% Esta funci�n visualiza el movimiento de una membrana cuadrada de tama�o
% (n+2) x (n+2).
% Datos de entrada:
% - n:      n�mero de nodos intermedios.
% - opcion: valor entero que recoge el modo de resoluci�n del sistema de 
%           ecuaciones. Toma los siguientes valores:
%   * 1:    Resoluci�n mediante el operador "\" de Matlab (ejercicio 1, 
%           seminario 6).
%   * 2:    Resoluci�n mediante las funciones de los ficheros .m
%           lu_kji, solve_tril_unidad y solve_triu (ejercicio 1, 
%           seminario 6).
%   * 3:    Resoluci�n mediante las funciones de los ficheros mex
%           lu_kji_mex, solve_tril_unidad_mex y solve_triu_mex 
%           (ejercicio 2, seminario 6).
%   * 4:    Resoluci�n mediante las funciones de los ficheros mex
%           lu_kji_mex, solve_tril_unidad_mex y solve_triu_mex sin calcular
%           la descomposici�n LU en cada iteraci�n (ejercicio 3, 
%           seminario 6).
%   * 5:    Resoluci�n mediante las funciones de los ficheros mex
%           lu_kji_banda_mex, solve_tril_unidad_banda_mex y
%           solve_triu_banda_mex sin calcular la descomposici�n LU en cada 
%           iteraci�n y considerando matrices banda (ejercicio 4, 
%           seminario 6).
%
% Variables con la deformaci�n en 2D (en forma de matriz) en todos los 
% nodos de la membrana, incluyendo los nodos frontera
% Establecemos las condiciones de contorno en los nodos frontera
Uk=zeros(n+2,n+2);  % Deformaci�n en el instante actual (k)
Uk1=zeros(n+2,n+2); % Deformaci�n en el instante anterior (k-1)
Uk2=zeros(n+2,n+2); % Deformaci�n en dos instantes anteriores (k-2)

% Diferencial o incremento de tiempo y su cuadrado
inct=0.05;
inct2=inct*inct;

% Diferencial o incremento espacial y su cuadrado
incx=1/(n+1);
incx2=incx*incx;

% Cociente entre ambos incrementos al cuadrado
mu=inct2/incx2;

% Valor inicial de la deformaci�n en el instante k-1  
% Es interesante cambiar uno de los senos (o los dos) por un coseno,   
% o incrementar la constante KA para que las vibraciones tengan m�s 
% amplitud  
KA=0.01;
for i=2:n+1
   for j=2:n+1
      Uk1(i,j)=KA*(sin(pi*i/(n+2))+sin(pi*j/(n+2)));
   end  
end

% Paso de la deformaci�n en 2D a un vector. Los vectores s�lo almacenan la 
% deformaci�n en los nodos interiores de la membrana. Son por tanto
% vectores de tama�o n*n
u=zeros(n*n,1);                      % Deformaci�n en el instante k  
u1=reshape(Uk1(2:n+1,2:n+1)',n*n,1); % Deformaci�n en el instante k-1
u2=reshape(Uk2(2:n+1,2:n+1)',n*n,1); % Deformaci�n en el instante k-2 

% Generaci�n de la matriz de coeficientes de tama�o n x n
A=crea_matriz(n,mu);

% Mostramos la estructura de la matriz A
%spy(A)
%pause
% Creaci�n del objeto pel�cula
M=moviein(25);

% Inicializamos a 0 el tiempo de ejecuci�n
tiempo=0;

tic
% =====================================================
% DESCOMPOSICI�N LU DE LA MATRIZ DE COEFICIENTES
% -----------------------------------------------------
if opcion==4
    % Descomposici�n LU mediante el fichero mex lu_kji_mex (ejercicio 3, 
    % seminario 6);
    % Pendiente de completar    
    
% -----------------------------------------------------
elseif opcion==5
    % Descomposici�n LU mediante el fichero mex lu_kji_banda_mex tras su
    % optimizaci�n para matrices banda (ejercicio 4, seminario 6)
    % Pendiente de completar
    
end
% =====================================================
tiempo=tiempo+toc;

% Simulamos 100 pasos, de "inct" segundos cada uno.
for k=1:100
   % Creaci�n del vector parte derecha
   b=2*u1-u2; 
   % Ponemos el reloj en marcha
   tic
   % C�lculo del vector u con la deformaci�n en el instante k actual
   % =====================================================
   % RESOLUCI�N DEL SISTEMA DE ECUACIONES LINEALES A*u=b
   % -----------------------------------------------------
   if opcion==1
       % Resoluci�n mediante el operador "\" de Matlab (ejercicio 1, 
       % seminario 6)           
       u=A\b;
   % -----------------------------------------------------   
   elseif opcion==2
       % Resoluci�n mediante las funciones de los ficheros .m lu_kji, 
       % solve_tril_unidad y solve_triu (ejercicio 1, seminario 6)
       LU=lu_kji(A);
       y=solve_tril_unidad(LU,b);
       u=solve_triu(LU,y);
   % -----------------------------------------------------          
   elseif opcion==3
       % Resoluci�n mediante las funciones de los ficheros mex lu_kji_mex, 
       % solve_tril_unidad_mex y solve_triu_mex (ejercicio 2, seminario 6)
       % Pendiente de completar
    
   % -----------------------------------------------------          
   elseif opcion==4
       % Resoluci�n de los sistemas triangulares mediante los ficheros mex
       % solve_tril_unidad_mex y solve_triu_mex, sin calcular la 
       % descomposici�n LU en cada iteraci�n (ejercicio 3, seminario 6)
       % Pendiente de completar
     
   % -----------------------------------------------------
   elseif opcion==5
       % Resoluci�n de los sistemas triangulares mediante los ficheros mex
       % solve_tril_unidad_banda_mex y solve_triu_banda_mex, sin calcular 
       % la descomposici�n LU en cada iteraci�n y tras la optimizaci�n para
       % matrices banda (ejercicio 4, seminario 6)
       % Pendiente de completar
       
   end
   % =====================================================
   % Incrementamos el tiempo de ejecuci�n
   tiempo=tiempo+toc;  
   % Actualizamos la deformaci�n en los instantes anteriores
   u2=u1;
   u1=u;
   % Cada cuatro pasos se genera el gr�fico de la membrana 
   % y se guarda un "fotograma" para la pel�cula
   if (rem(k,4)==0)
      % Reconstruimos la soluci�n en 2D para visualizarla
      Uk(2:n+1,2:n+1)=reshape(u,n,n)'; 
      surf(Uk),axis([0 n+2 0 n+2 -0.12 0.12]);
      M(:,k/4)=getframe;
   end 
 end
% Visualizamos la pel�cula generada
movie(M);
% Mostramos el tiempo de ejecuci�n
tiempo
