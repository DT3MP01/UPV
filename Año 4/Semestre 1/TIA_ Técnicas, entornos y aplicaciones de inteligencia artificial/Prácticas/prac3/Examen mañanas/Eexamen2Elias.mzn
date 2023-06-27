include "alldifferent.mzn";
int: N = 10;
int: dimX = 50;
int: dimY = 50;
array [1..N] of var int: alto = [10, 15, 20, 25, 20, 25, 15, 10, 20, 15];
array [1..N] of var int: ancho = [15, 5, 15, 10, 25, 10, 15, 20, 10, 10];
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

constraint forall (i in 1..N) (x[i] >= 0 /\ x[i] <= dimX - ancho[i]);
constraint forall (i in 1..N) (y[i] >= 0 /\ y[i] <= dimY - alto[i]);

constraint (dimX == dimY);
solve minimize(dimX * dimY);

output ["DimX: ", show(dimX), "\n"];
output ["DimY: ", show(dimY), "\n"];
output ["Minimum surface: ", show(dimX * dimY), "\n"];
output ["Xi = ", show(x), "\n"];
output ["Yi = ", show(y)];
