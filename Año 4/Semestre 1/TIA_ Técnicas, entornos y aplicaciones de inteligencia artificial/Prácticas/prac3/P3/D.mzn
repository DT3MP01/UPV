include "alldifferent.mzn";
int: N = 5;
var 0..1000: dimX;
var 0..1000: dimY;
var 0..1: isRotated;
var 30..40: altoL;
var 30..40: anchoL;
constraint if isRotated == 1 then altoL = 40 /\ anchoL = 30 else altoL = 30 /\ anchoL = 40 endif;
array [1..N] of var int: alto = [10, 15, 20, 20, altoL];
array [1..N] of var int: ancho = [15, 5, 15, 25, anchoL];
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
constraint forall (i in 1..N) (x[i] >= 0 /\ x[i] <= dimX - ancho[i]);

% Restricción del rectángulo por altura
constraint forall (i in 1..N) (y[i] >= 0 /\ y[i] <= dimY - alto[i]);

solve minimize(dimX * dimY);

output ["DimX: ", show(dimX), "\n"];
output ["DimY: ", show(dimY), "\n"];
output ["Minimum surface: ", show(dimX * dimY), "\n"];
output ["Xi = ", show(x), "\n"];
output ["Yi = ", show(y)];
