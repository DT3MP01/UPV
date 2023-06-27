include "alldifferent.mzn";
int: N = 15;
var 0..1000: dimX;
var 0..1000: dimY;
array [1..N] of var int: alto = [10, 15, 20, 25, 20, 25, 15, 10, 20, 15, 10, 15, 20, 10, 25];
array [1..N] of var int: ancho = [15, 5, 15, 10, 25, 10, 15, 20, 10, 10, 10, 20, 5, 5, 5];
array [1..N] of var int: x;
array [1..N] of var int: y;

constraint forall (i, j in 1..N where i != j) 
  (
    (x[i] >= x[j] + ancho[j]) \/
    (x[j] >= x[i] + ancho[i]) \/ 
    (y[i] >= y[j] + alto[j]) \/
    (y[j] >= y[i] + alto[i])
  );

constraint forall (i in 1..N) (x[i] >= 0 /\ x[i] <= dimX - ancho[i]);
constraint forall (i in 1..N) (y[i] >= 0 /\ y[i] <= dimY - alto[i]);

constraint 
  (
    (x[5] + ancho[5] = x[8] /\ (y[5] + alto[5] - alto[8] = y[8] \/ y[5] + alto[5] = y[8])) \/
    (x[8] + ancho[8] = x[5] /\ (y[8] + alto[8] - alto[5] = y[5] \/ y[8] + alto[8] = y[5]))
  );

constraint (dimX == dimY);
solve minimize(dimX * dimY);

output ["DimX: ", show(dimX), "\n"];
output ["DimY: ", show(dimY), "\n"];
output ["Minimum surface: ", show(dimX * dimY), "\n"];
output ["Xi = ", show(x), "\n"];
output ["Yi = ", show(y)];
