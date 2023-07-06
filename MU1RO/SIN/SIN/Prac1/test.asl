/* Beliefs */
adyacente(a, b).
adyacente(b, c).
adyacente(c, d).
adyacente(d, e).

localizado(robot, b).
localizado(papel_usado, c).
localizado(papelera, e).
papelera(3).

/* Goals */
!papelera(0).

+!papelera(N): N>0
	<- .print("papel cogido en ", N); 
		-+papelera(N-1)
		+!papelera(N-1).
