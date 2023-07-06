include "alldifferent.mzn";
int:n=15;
int:dimX=40;
var 0..100:dimY;
array [1..n] of var int: ancho= [15, 5, 15, 10, 25, 10, 15, 20, 10, 10, 10, 20, 5, 5, 5];
array [1..n] of var int: alto= [10, 15, 20, 25, 20, 25, 15, 10, 20, 15, 10, 15, 20, 10, 25];

array [1..n] of var int: x;
array [1..n] of var int: y;

/*Condicion de no solape*/
constraint forall (i,j in 1..n where i < j) ((x[i] >= x[j] + ancho[j])  \/  (x[j]>= x[i] + ancho[i]) \/ (y[j]>= y[i] + alto[i])  \/ (y[i] >= y[j] + alto[j]));
/*Condición de delimitación */
constraint forall (i in 1..n) (x[i]>=0 /\ x[i]+ancho[i]<=dimX);
constraint forall (i in 1..n) (y[i]>=0 /\ y[i]+alto[i]<=dimY);



solve minimize(dimY);

output ["Altura minima ",show(dimY),"\n"];
output ["Xi = "];
output [( show(x[i]) ++ " " ) | i in 1..n];
output ["\n"];
output ["Yi = "];
output [(show(y[i]) ++ " ") | i in 1..n];