include "alldifferent.mzn";
int: N = 10;
int: dimX = 40;
var 0..1000: dimY;
array [1..N] of var int: alto = [10, 15, 20, 25, 20, 25, 15, 10, 20, 15];
array [1..N] of var int: ancho = [15, 5, 15, 10, 25, 10, 15, 20, 10, 10];
array [1..N] of var int: x;
array [1..N] of var int: y;

% Condición de no solape
constraint forall (i, j in 1..N where i != j) 
  (
    (x[i] >= x[j] + ancho[j]) \/
    (x[j] >= x[i] + ancho[i]) \/ 
    (y[i] >= y[j] + alto[j]) \/
    (y[j] >= y[i] + alto[i])
  );

% Restricción del rectángulo por anchura
constraint forall (i in 1..N) (x[i] >= 0 /\ x[i] <= dimX - ancho[i]);

% Restricción del rectángulo por altura
constraint forall (i in 1..N) (y[i] >= 0 /\ y[i] <= dimY - alto[i]);

solve minimize(dimY);

output ["DimX: ", show(dimX), "\n"];
output ["DimY: ", show(dimY), "\n"];
output ["Minimum surface: ", show(dimX * dimY), "\n"];
output ["Xi = ", show(x), "\n"];
output ["Yi = ", show(y)];