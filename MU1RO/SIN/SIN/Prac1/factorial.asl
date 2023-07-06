/* Creencias iniciales */
fact(7).


/* Planes */
+fact(N)
  <- +fact(0,1,N).

+fact(X,Y,Z) : Z>0
  <-+fact(X+1,  (X+1) * Y ,Z-1).

+fact(X,Y,Z) : Z=0
  <-   .print("fact", X," == ", Y).
