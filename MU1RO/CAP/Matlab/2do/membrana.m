function membrana(n,opcion)
% Esta función visualiza el movimiento de una membrana cuadrada de tamaño
% (n+2) x (n+2).
% Datos de entrada:
% - n:      número de nodos intermedios.
% - opcion: valor entero que recoge el modo de resolución del sistema de 
%           ecuaciones. Toma los siguientes valores:
%   * 1:    Resolución mediante el operador "\" de Matlab (ejercicio 1, 
%           seminario 6).
%   * 2:    Resolución mediante las funciones de los ficheros .m
%           lu_kji, solve_tril_unidad y solve_triu (ejercicio 1, 
%           seminario 6).
%   * 3:    Resolución mediante las funciones de los ficheros mex
%           lu_kji_mex, solve_tril_unidad_mex y solve_triu_mex 
%           (ejercicio 2, seminario 6).
%   * 4:    Resolución mediante las funciones de los ficheros mex
%           lu_kji_mex, solve_tril_unidad_mex y solve_triu_mex sin calcular
%           la descomposición LU en cada iteración (ejercicio 3, 
%           seminario 6).
%   * 5:    Resolución mediante las funciones de los ficheros mex
%           lu_kji_banda_mex, solve_tril_unidad_banda_mex y
%           solve_triu_banda_mex sin calcular la descomposición LU en cada 
%           iteración y considerando matrices banda (ejercicio 4, 
%           seminario 6).
%   * 6:    Resolución mediante el fichero mex dgesv_mex, encargado de 
%           invocar a la función dgesv de LAPACK (ejercicio 1, 
%           seminario 7).
%   * 7:    Resolución mediante los ficheros mex dgetrf_mex y dgetrs_mex, 
%           encargados de invocar a las funciones dgetrf y dgetrs de 
%           LAPACK, sin calcular la descomposición LU en cada iteración 
%           (ejercicios 2 y 3, seminario 7).
%   * 8:    Resolución mediante la descomposición LU de Matlab (función LU) 
%           siendo A una matriz densa y sin calcular la descomposición LU 
%           en cada iteración. Los sistemas triangulares se resuelven
%           mediante el operador "\" de Matlab (ejercicio 4, seminario 7).
%   * 9:    Resolución mediante la descomposición de Cholesky de Matlab 
%           (función chol) siendo A una matriz densa y sin calcular la 
%           descomposición de Cholesky en cada iteración. Los sistemas 
%           triangulares se resuelven mediante el operador "\" de Matlab 
%           (ejercicio 5, seminario 7).
%   * 10    Resolución mediante la descomposición de Cholesky de Matlab 
%           (función chol) siendo A una matriz dispersa y sin calcular la 
%           descomposición de Cholesky en cada iteración. Los sistemas 
%           triangulares se resuelven mediante el operador "\" de Matlab 
%           (ejercicio 6, seminario 7).
%   * 11    Resolución mediante la descomposición de Cholesky de Matlab 
%           (función chol) siendo A una matriz dispersa reordenada mediante
%           el método de Cuthill-McKee Inverso Simétrico (función symrcm) y
%           sin calcular la descomposición de Cholesky en cada iteración. 
%           Los sistemas triangulares se resuelven mediante el operador "\"
%           de Matlab (ejercicio 7, seminario 7).
%   * 12    Resolución mediante la descomposición de Cholesky de Matlab 
%           (función chol) siendo A una matriz dispersa reordenada mediante
%           el método de Mínimo Grado Aproximado Simétrico (función symamd) 
%           y sin calcular la descomposición de Cholesky en cada iteración. 
%           Los sistemas triangulares se resuelven mediante el operador "\"
%           de Matlab (ejercicio 7, seminario 7).
%
% Variables con la deformación en 2D (en forma de matriz) en todos los 
% nodos de la membrana, incluyendo los nodos frontera
% Establecemos las condiciones de contorno en los nodos frontera
Uk=zeros(n+2,n+2);  % Deformación en el instante actual (k)
Uk1=zeros(n+2,n+2); % Deformación en el instante anterior (k-1)
Uk2=zeros(n+2,n+2); % Deformación en dos instantes anteriores (k-2)

% Diferencial o incremento de tiempo y su cuadrado
inct=0.05;
inct2=inct*inct;

% Diferencial o incremento espacial y su cuadrado
incx=1/(n+1);
incx2=incx*incx;

% Cociente entre ambos incrementos al cuadrado
mu=inct2/incx2;

% Valor inicial de la deformación en el instante k-1  
% Es interesante cambiar uno de los senos (o los dos) por un coseno,   
% o incrementar la constante KA para que las vibraciones tengan más 
% amplitud  
KA=0.01;
for i=2:n+1
   for j=2:n+1
      Uk1(i,j)=KA*(sin(pi*i/(n+2))+sin(pi*j/(n+2)));
   end  
end

% Paso de la deformación en 2D a un vector. Los vectores sólo almacenan la 
% deformación en los nodos interiores de la membrana. Son por tanto
% vectores de tamaño n*n
u=zeros(n*n,1);                      % Deformación en el instante k  
u1=reshape(Uk1(2:n+1,2:n+1)',n*n,1); % Deformación en el instante k-1
u2=reshape(Uk2(2:n+1,2:n+1)',n*n,1); % Deformación en el instante k-2 

% Generación de la matriz de coeficientes de tamaño n x n
A=crea_matriz(n,mu);

% Mostramos la estructura de la matriz A
%spy(A)
%pause
% Creación del objeto película
M=moviein(25);

% Inicializamos a 0 el tiempo de ejecución
tiempo=0;

tic
% =====================================================
% DESCOMPOSICIÓN LU DE LA MATRIZ DE COEFICIENTES
% -----------------------------------------------------
if opcion==4
    % Descomposición LU mediante el fichero mex lu_kji_mex (ejercicio 3, 
    % seminario 6)
    LU=lu_kji_mex(A);    
% -----------------------------------------------------
elseif opcion==5
    % Descomposición LU mediante el fichero mex lu_kji_banda_mex tras su
    % optimización para matrices banda (ejercicio 4, seminario 6)
    LU=lu_kji_banda_mex(A);
% -----------------------------------------------------    
elseif opcion==7
    % Descomposición LU mediante el fichero dgetrf_mex, encargado de 
    % invocar a la función dgetrf de LAPACK (ejercicio 2, seminario 7) 
    % Pendiente de completar
    [LU, iPivot ] =dgetrf_mex(A);
% -----------------------------------------------------
elseif opcion==8
    % Descomposición LU mediante la función LU de Matlab, siendo A una 
    % matriz densa (ejercicio 4, seminario 7)
    % Pendiente de completar    
    [L,U]=lu(A);
% -----------------------------------------------------
elseif opcion==9
    % Descomposición de Cholesky mediante la función chol de Matlab, siendo
    % A una matriz densa (ejercicio 5, seminario 7)
    % Pendiente de completar    
    L=chol(A,'lower');
    U=L';
% -----------------------------------------------------
elseif opcion==10
    % Descomposición de Cholesky mediante la función chol de Matlab, siendo
    % A una matriz dispersa (ejercicio 6, seminario 7)
    % Pendiente de completar 
    A=sparse(A);
    L=chol(A,'lower');
    U=L';
% -----------------------------------------------------
elseif opcion==11
    % Descomposición de Cholesky mediante la función chol de Matlab, siendo
    % A una matriz dispersa reordenada mediante el método de Cuthill-McKee 
    % Inverso Simétrico (ejercicio 7, seminario 7)
    % Pendiente de completar
    A=sparse(A);
    p=symrcm(A);
    R=A(p,p);
    L=chol(R,'lower');
    U=L';
% -----------------------------------------------------
elseif opcion==12
    % Descomposición de Cholesky mediante la función chol de Matlab, siendo
    % A una matriz dispersa reordenada mediante el método de Mínimo Grado 
    % Aproximado Simétrico (ejercicio 7, seminario 7)
    % Pendiente de completar
    A=sparse(A);
    p=symamd(A);
    R=A(p,p);
    L=chol(R,'lower');
    U=L';

end
% =====================================================
tiempo=tiempo+toc;

% Simulamos 100 pasos, de "inct" segundos cada uno.
for k=1:100
   % Creación del vector parte derecha
   b=2*u1-u2; 
   % Ponemos el reloj en marcha
   tic
   % Cálculo del vector u con la deformación en el instante k actual
   % =====================================================
   % RESOLUCIÓN DEL SISTEMA DE ECUACIONES LINEALES A*u=b
   % -----------------------------------------------------
   if opcion==1
       % Resolución mediante el operador "\" de Matlab (ejercicio 1, 
       % seminario 6)           
       u=A\b;
   % -----------------------------------------------------   
   elseif opcion==2
       % Resolución mediante las funciones de los ficheros .m lu_kji, 
       % solve_tril_unidad y solve_triu (ejercicio 1, seminario 6)
       LU=lu_kji(A);
       y=solve_tril_unidad(LU,b);
       u=solve_triu(LU,y);
   % -----------------------------------------------------          
   elseif opcion==3
       % Resolución mediante las funciones de los ficheros mex lu_kji_mex, 
       % solve_tril_unidad_mex y solve_triu_mex (ejercicio 2, seminario 6)
       LU=lu_kji_mex(A);
       y=solve_tril_unidad_mex(LU,b);
       u=solve_triu_mex(LU,y);     
   % -----------------------------------------------------          
   elseif opcion==4
       % Resolución de los sistemas triangulares mediante los ficheros mex
       % solve_tril_unidad_mex y solve_triu_mex, sin calcular la 
       % descomposición LU en cada iteración (ejercicio 3, seminario 6)
       y=solve_tril_unidad_mex(LU,b);
       u=solve_triu_mex(LU,y);      
   % -----------------------------------------------------
   elseif opcion==5
       % Resolución de los sistemas triangulares mediante los ficheros mex
       % solve_tril_unidad_banda_mex y solve_triu_banda_mex, sin calcular 
       % la descomposición LU en cada iteración y tras la optimización para
       % matrices banda (ejercicio 4, seminario 6)
       y=solve_tril_unidad_banda_mex(LU,b);
       u=solve_triu_banda_mex(LU,y);        
   % -----------------------------------------------------
   elseif opcion==6
       % Resolución mediante el fichero mex dgesv_mex, encargado de invocar
       % a la función dgesv de LAPACK (ejercicio 1, seminario 7)      
       % Pendiente de completar
        u = dgesv_mex(A, b);
   % -----------------------------------------------------
   elseif opcion==7
       % Resolución de los sistemas triangulares mediante el fichero mex
       % dgetrs_mex, encargado de invocar a la función dgetrs de LAPACK, 
       % sin calcular la descomposición LU en cada iteración (ejercicio 3, 
       % seminario 7)        
       % Pendiente de completar
       u = dgetrs_mex(LU, b, iPivot);
   % -----------------------------------------------------       
   elseif opcion>=8 && opcion<=10
       % Resolución de los sistemas triangulares mediante el operador "\" 
       % de Matlab, sin calcular la descomposición LU o la de Cholesky en
       % cada iteración (ejercicios 4, 5 y 6, seminario 7)
       % Pendiente de completar
       y=L\b;
       u=U\y;

   % -----------------------------------------------------
   elseif opcion>=11 && opcion<=12
       % Resolución de los sistemas triangulares mediante el operador "\" 
       % de Matlab, tras haber reordenado la matriz mediante los métodos de
       % Cuthill-McKee Inverso Simétrico o por Mínimo Grado Aproximado 
       % Simétrico y tras haber calculado la descomposición de Cholesky 
       % (ejercicio 7, seminario 7)       
       % Pendiente de completar 
       br=b(p);
       y=L\br;
       ur=U\y;
       u(p)=ur;

   end
   % =====================================================
   % Incrementamos el tiempo de ejecución
   tiempo=tiempo+toc;  
   % Actualizamos la deformación en los instantes anteriores
   u2=u1;
   u1=u;
   % Cada cuatro pasos se genera el gráfico de la membrana 
   % y se guarda un "fotograma" para la película
   if (rem(k,4)==0)
      % Reconstruimos la solución en 2D para visualizarla
      Uk(2:n+1,2:n+1)=reshape(u,n,n)'; 
      surf(Uk),axis([0 n+2 0 n+2 -0.12 0.12]);
      M(:,k/4)=getframe;
   end 
 end
% Visualizamos la película generada
movie(M);
% Mostramos el tiempo de ejecución
tiempo
