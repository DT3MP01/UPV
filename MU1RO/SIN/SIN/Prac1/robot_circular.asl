/* Beliefs */
adyacente(a, b).
adyacente(b, c).
adyacente(c, d).
adyacente(d, e).
adyacente(e,a).

localizado(robot, b).


localizado(papel_usado, d).
localizado(papel_usado, a).
localizado(papel_usado, c).

localizado(papelera, e).


/* Events */	
!recogePapeles.

+!recogePapeles: localizado(papel_usado, Z)
			<- .print("papel en ", Z,"a moverse");
			   !localizado(robot, Z).

+!recogePapeles: localizado(robot, Z) & localizado(papelera,Z)
			<- .print("Ha terminado").

/* Events */	
+localizado(robot, X) : localizado(papel_usado, X) & localizado(papelera, Y)
			<- .print("papel cogido en ", X); 
			   -localizado(papel_usado, X).
			   
/* Mover Izquierda */
+!localizado(robot, X) : localizado(robot, Y) & (not (X=Y)) & adyacente(Y,Z) 
			<- .print("mover de ", Y, " a ", Z);  
			   -+localizado(robot, Z); 
			   !localizado(robot, X).

+!localizado(robot, X) : localizado(robot, X) & localizado(papelera, X)
						 <- !recogePapeles.


+!localizado(robot, X) : localizado(robot, X) & localizado(papelera, Z)
						 <- .print("Llevando a la papelera");
						 !localizado(robot, Z).



 


