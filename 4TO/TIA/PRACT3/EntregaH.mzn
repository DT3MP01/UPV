include "alldifferent.mzn";
int:n=15;
var 0..100:dimX;
var 0..100:dimY;
array [1..n] of var int: ancho= [15, 5, 15, 10, 25, 10, 15, 20, 10, 10, 10, 20, 5, 5, 5];
array [1..n] of var int: alto= [10, 15, 20, 25, 20, 25, 15, 10, 20, 15, 10, 15, 20, 10, 45];
array [1..n] of var int: x;
array [1..n] of var int: y;

/*Condición de no solape */
constraint forall (i,j in 1..n-1 where i < j) ((x[i] >= x[j] + ancho[j])  \/  (x[j]>= x[i] + ancho[i]) \/ (y[j]>= y[i] + alto[i])  \/ (y[i] >= y[j] + alto[j]));
/*Condición de delimitación */
constraint forall (i in 1..n-1) (x[i]>=0 /\ x[i]<=dimX-ancho[i]);
constraint forall (i in 1..n-1) (y[i]>=0 /\ y[i]<=dimY-alto[i]);

/*Condincion de no solape del ultimo elemento , puede ser ancho o alto */
constraint ((forall (j in 1..n-1) ((x[n] >= x[j] + ancho[j])  \/  (x[j]>= x[n] + alto[n]) \/ (y[j]>= y[n] + ancho[n])  \/ (y[n] >= y[j] + alto[j])))/\ x[n]<=dimX-alto[n]/\ y[n]<=dimY-ancho[n])
            \/ ((forall (j in 1..n-1) ((x[n] >= x[j] + ancho[j])  \/  (x[j]>= x[n] + ancho[n]) \/ (y[j]>= y[n] + alto[n])  \/ (y[n] >= y[j] + alto[j])))/\ x[n]<=dimX-ancho[n]/\ y[n]<=dimY-alto[n]) ;
constraint x[n]>=0;
constraint y[n]>=0;
/*Condincion de cuadrado */
constraint (dimX = dimY);

solve minimize(dimX * dimY);


output ["DimX ",show(dimX),"\n"];
output ["DimY ",show(dimY),"\n"];
output ["Superficie minima ",show(dimX * dimY),"\n"];
output ["Xi = "];
output [( show(x[i]) ++ " " ) | i in 1..n];
output ["\n"];
output ["Yi = "];
output [(show(y[i]) ++ " ") | i in 1..n];
