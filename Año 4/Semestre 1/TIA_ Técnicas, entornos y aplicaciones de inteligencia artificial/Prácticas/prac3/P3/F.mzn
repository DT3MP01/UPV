include "alldifferent.mzn";
int: n = 15;
var 0..1000: dimX;
var 0..1000: dimY;
array [1..n] of var int: alto = [10, 15, 20, 25, 20, 25, 15, 10, 20, 15, 10, 15, 20, 10, 25];
array [1..n] of var int: ancho = [15, 5, 15, 10, 25, 10, 15, 20, 10, 10, 10, 20, 5, 5, 5];
array [1..n] of var int: x;
array [1..n] of var int: y;

constraint forall (i, j in 1..n where i != j) 
  (
    (x[i] >= x[j] + ancho[j]) \/
    (x[j] >= x[i] + ancho[i]) \/ 
    (y[i] >= y[j] + alto[j]) \/
    (y[j] >= y[i] + alto[i])
  );

constraint forall (i in 1..n) (x[i] >= 0 /\ x[i] <= dimX - ancho[i]);
constraint forall (i in 1..n) (y[i] >= 0 /\ y[i] <= dimY - alto[i]);

constraint (x[3] + ancho[3] + 1 = x[4] /\ y[3] + alto[3] = y[4]);
constraint (dimX == dimY);
solve minimize(dimX * dimY);

output ["DimX: ", show(dimX), "\n"];
output ["DimY: ", show(dimY), "\n"];
output ["Minimum surface: ", show(dimX * dimY), "\n"];
output ["Xi = ", show(x), "\n"];
output ["Yi = ", show(y)];
