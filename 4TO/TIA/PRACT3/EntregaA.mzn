include "alldifferent.mzn";
int:n=5;
int:dimX=60;
int:dimY=60;
array [1..n] of var int: ancho= [15, 5, 15, 25, 40];
array [1..n] of var int: alto= [10, 15, 20, 20, 30];
array [1..n] of var int: x;
array [1..n] of var int: y;

/*Condicion de no solape*/
constraint forall (i,j in 1..n where i < j) ((x[i] >= x[j] + ancho[j])  \/  (x[j]>= x[i] + ancho[i]) \/ (y[j]>= y[i] + alto[i])  \/ (y[i] >= y[j] + alto[j]));
/*Restriccion a dimX y dimY*/
constraint forall (i in 1..n) (x[i]>=0 /\ x[i]<=dimX-ancho[i]);
constraint forall (i in 1..n) (y[i]>=0 /\ y[i]<=dimY-alto[i]);

solve satisfy;
output ["Xi = "];
output [( show(x[i]) ++ " " ) | i in 1..n];
output ["\n"];
output ["Yi = "];
output [(show(y[i]) ++ " ") | i in 1..n];
