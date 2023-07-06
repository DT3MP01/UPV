/* Beliefs */
adyacente(1, "a").
adyacente(2, "b").
adyacente(3, "c").
adyacente(4, "d").
adyacente(5,"e").

localizado(robot, "b").
robotCarga(0).


localizado(papel_usado, "d").
localizado(papel_usado, "a").
localizado(papel_usado, "c").

localizado(papelera, "e").
papeleraCarga(0).

/* Events */	
!recogePapeles.

+!recogePapeles: localizado(papel_usado, Z)
			<- .print("papel en ", Z);
			   !localizado(robot, Z).

+!recogePapeles: localizado(robot, Z) & localizado(papelera,Z) & papeleraCarga(X)
			<- .print("Ha terminado, en la papelera hay",X,"papeles").

+!recogePapeles: localizado(papelera, Z)
			<- .print("Papelera en",Z);
			   !localizado(robot, Z).

/* Events */	
+localizado(robot, X) : localizado(papel_usado, X) & localizado(papelera, Y) & robotCarga(Z)
			<- .print("papel cogido en ", X);
			   -+robotCarga(Z+1); 
			   -localizado(papel_usado, X).
			   
/* Mover Derecha */
+!localizado(robot, X) : localizado(robot, Y) & (not (X=Y)) & adyacente(Y,Z) & X-Y>0 & X-Y<Y+(5-X)
			<- .print("mover de ", Y, " a ", Z,"der");  
			   -+localizado(robot, Z); 
			   !localizado(robot, X).

/* Mover Izquierda  */
+!localizado(robot, X) : localizado(robot, Y) & (not (X=Y)) & adyacente(Z,Y)
			<- .print("mover de ", Y, " a ", Z,"iz");  
			   -+localizado(robot, Z); 
			   !localizado(robot, X).


+!localizado(robot, X) : localizado(robot, X) & localizado(papelera, X) &
						 robotCarga(Y) & papeleraCarga(Z)
						 <- .print("Depositando",Y,"papeles en la papelera");
						 	-+papeleraCarga(Z+Y);
						 	-+robotCarga(0);
						 	!recogePapeles.


+!localizado(robot, X) : localizado(robot, X) & localizado(papelera, Z)
						 <- !recogePapeles.