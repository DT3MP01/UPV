include "alldifferent.mzn";
int: N = 5; % número de rectángulos
int: dimX = 60;
int: dimY = 60;
array [1..N] of var int: alto = [10, 15, 20, 20, 30];
array [1..N] of var int: ancho = [15, 5, 15, 25, 40];
array [1..N] of var int: x;
array [1..N] of var int: y;

% Restricción de solape
constraint forall (i, j in 1..N where i != j) 
  (
    (x[i] >= x[j] + ancho[j]) \/
    (x[j] >= x[i] + ancho[i]) \/ 
    (y[i] >= y[j] + alto[j]) \/
    (y[j] >= y[i] + alto[i])
  );

% Restricción del rectángulo por anchura
constraint forall (i in 1..N) (x[i] >= 0 /\ x[i] <= dimX);

%Restricción del rectángulo por altura
constraint forall (i in 1..N) (y[i] >= 0 /\ y[i] <= dimY);

solve satisfy;

output ["DimX: ", show(dimX), "\n"];
output ["DimY: ", show(dimY), "\n"];
output ["Minimum surface: ", show(dimX * dimY), "\n"];
output ["Xi = ", show(x), "\n"];
output ["Yi = ", show(y)];
