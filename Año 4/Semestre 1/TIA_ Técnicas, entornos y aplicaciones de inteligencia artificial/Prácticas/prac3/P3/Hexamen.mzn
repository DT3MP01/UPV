include "alldifferent.mzn";
int: N = 10;
var 0..1000: dimX;
var 0..1000: dimY;
var 0..1: isRotated;
var 5..45: altoL;
var 5..45: anchoL;
constraint if isRotated == 1 then altoL = 45 /\ anchoL = 5 else altoL = 5 /\ anchoL = 45 endif;
array [1..N] of var int: alto = [10, 15, 20, 25, 20, 25, 15, 10, 20, 45];
array [1..N] of var int: ancho = [15, 5, 15, 10, 25, 10, 15, 20, 10, 5];
array [1..N] of var int: x;
array [1..N] of var int: y;

constraint forall (i, j in 1..N where i != j) 
  (
    (x[i] >= x[j] + ancho[j]) \/
    (x[j] >= x[i] + ancho[i]) \/ 
    (y[i] >= y[j] + alto[j]) \/
    (y[j] >= y[i] + alto[i])
  );

/* Rotación de último rectángulo */
constraint forall (i in 1..N-1) 
  (
    (x[N] >= x[i] + ancho[i]) \/ 
    (x[i] >= x[N] + ancho[N]) \/ 
    (y[i] >= y[N] + alto[N]) \/ 
    (y[N] >= y[i] + alto[i]) /\
    % Rectángulo rotado 
    (x[N] >= x[i] + ancho[i]) \/ 
    (x[i] >= x[N] + alto[N]) \/ 
    (y[i] >= y[N] + ancho[N]) \/ 
    (y[N] >= y[i] + alto[i])
  );

% Restricción del rectángulo por anchura
constraint forall (i in 1..N) (x[i] >= 0 /\ x[i] <= dimX - ancho[i]);

% Restricción del rectángulo por altura
constraint forall (i in 1..N) (y[i] >= 0 /\ y[i] <= dimY - alto[i]);

constraint(dimX == dimY);
solve minimize(dimX * dimY);

output ["DimX: ", show(dimX), "\n"];
output ["DimY: ", show(dimY), "\n"];
output ["Minimum surface: ", show(dimX * dimY), "\n"];
output ["Xi = ", show(x), "\n"];
output ["Yi = ", show(y)];