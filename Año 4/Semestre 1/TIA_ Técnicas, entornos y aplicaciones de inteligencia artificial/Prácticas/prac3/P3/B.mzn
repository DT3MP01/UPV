include "alldifferent.mzn";
int: N = 5;
var 0..1000: dimX;
var 0..1000: dimY;
array [1..N] of var int: alto = [10, 15, 20, 20, 30];
array [1..N] of var int: ancho = [15, 5, 15, 25, 40];
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

constraint (dimX == dimY);
solve minimize(dimX * dimY);

output ["Minimum surface: ", show(dimX * dimY)];

