// Creencia que se dispara cuando se inicia la partida

+flag(F): team(200)
	<-
	!escogerGeneral.

+!escogerGeneral: team(200)
	<-
	+seleccionando_general;
	.get_backups.

+myBackups(B): seleccionando_general
	<-
	?name(N);
	.concat(B, [N], B1);
	.print(B);
	.newGeneralElection(B1,GE);
	if (N == GE) {
		.register_service("general");
	}
	-seleccionando_general.
