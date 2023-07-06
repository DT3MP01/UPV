include "alldifferent.mzn";
int:n=5;
var 0..10000:dimX;
var 0..10000:dimY;
array [1..n] of var int: ancho= [15, 5, 15, 25, 40 ];
array [1..n] of var int: alto= [10, 15, 20, 20, 30];
array [1..n] of var int: x;
array [1..n] of var int: y;

/*Condición de restricciones*/
constraint forall (i,j in 1..n where i < j) ((x[i] >= x[j] + ancho[j])  \/  (x[j]>= x[i] + ancho[i]) \/ (y[j]>= y[i] + alto[i])  \/ (y[i] >= y[j] + alto[j]));

/*Condición de delimitación */
constraint forall (i in 1..n) (x[i]>=0 /\ x[i]<=dimX-ancho[i]);
constraint forall (i in 1..n) (y[i]>=0 /\ y[i]<=dimY-alto[i]);


solve minimize(dimX * dimY);

output ["DimX ",show(dimX),"\n"];
output ["DimY ",show(dimY),"\n"];
output ["Superficie minima ",show(dimX * dimY),"\n"];
output ["Xi = "];
output [( show(x[i]) ++ " " ) | i in 1..n];
output ["\n"];
output ["Yi = "];
output [(show(y[i]) ++ " ") | i in 1..n];
