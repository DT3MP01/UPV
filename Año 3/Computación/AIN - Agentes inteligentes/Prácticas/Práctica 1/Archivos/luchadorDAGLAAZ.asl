// Luchador

/* Nombres:
David Arnal Garcia
Luis Alberto Alvarez Zavaleta */

+flag(F)
  <-
    ?position(P);
    ?base(B);
    # Me voy a la intersección más cercana
    C = [[120, 0, 114], [130, 0, 104], [140, 0, 114], [130, 0, 130]];
    +control_list(C);
    .length(C, L);
    # L = 4
    +total_points(L);
    # Me giro 360º al empezar para escanear enemigos
    .turn(1.5708);
    .wait(500);
    .turn(1.5708);
    .wait(500);
    .turn(1.5708);
    .wait(500);
    .turn(1.5708);
    .wait(500);
    if (not friends_in_fov(ID, Type, Angle, Distance, Health, Position)) {
      # .print("He mirado a mi alrededor y no hay nadie, me muevo al punto ", Position);
      +nearest_corner_intersection(P);
    }.
    # .print("Desplegado").

+enemy_search
  <-
    ?base(B);
    .look_at(B);
    .turn(1.5708);
    .wait(500);
    .turn(3.14159);
    .wait(500);
    .turn(1.5708);
    .wait(500);
    # .print("No hay nadie cerca mio");
    +enemy_search.

+health(X): X > 70 & low_health
  <-
    -low_health;
    +status_update.
    # .print("Me he curado").

+health(X): threshold_health(T) & X < T & not low_health & not friends_in_fov(ID, Type, Angle, Distance, Health, Position)
  <-
    +low_health;
    +status_update.
    # .print("Estoy mal de vida").

+ammo(X): X > 70 & low_ammo
  <-
    -low_ammo;
    +status_update.
    # .print("Recargado").

+ammo(X): threshold_ammo(T) & X < T & not low_ammo & not friends_in_fov(ID, Type, Angle, Distance, Health, Position)
  <-
    +low_ammo;
    +status_update.
    # .print("La municion escasea").

+patrolling_the_centre(P): total_points(T) & patrolling & P < T
  <-
    ?control_list(C);
    .nth(P, C, G);
    # .print("Buscando paquetes en: ", G);
    .goto(G).

+patrolling_the_centre(P): total_points(T) & patrolling & P >= T
  <-
    -+patrolling_the_centre(0).

+status_update: not patrolling & low_ammo
  <-
    # Si no estoy patrullando y tengo baja munición, voy al centro a por munición
    +patrolling;
    -nearest_corner_intersection;
    -going_to_intersection;
    +patrolling_the_centre(0);
    # .print("Buscando ammo");
    -status_update.

+status_update: not patrolling & low_health
  <-
    # Si no estoy patrullando y tengo baja vida, voy al centro a por vida
    +patrolling;
    -nearest_corner_intersection;
    -going_to_intersection;
    +patrolling_the_centre(0);
    # .print("Buscando medicina");
    -status_update.

+status_update: not low_ammo & not low_health
    <-
      # Si no tengo baja munición ni vida, voy a la intersección de esquinas más cercana
      ?position(P);
      -patrolling_the_centre(P);
      -patrolling;
      +going_to_intersection;
      +nearest_corner_intersection(P);
      # .print("Volviendo al punto ", P);
      -status_update.

+target_reached(T): patrolling
  <-
    -goingForMedPack;
    -goingForAmmoPack;
    # .print("T3");
    if (patrolling_the_centre(P)) {
      -+patrolling_the_centre(P + 1);
    }
    -target_reached(T).

+target_reached(T): going_to_intersection
  <-
    ?position(P);
    # .print("He llegado a: ", P);
    -going_to_intersection;
    -target_reached(T);
    +enemy_search.

+target_reached(T): following(F)
  <-
    ?position(P);
    # .print("T1");
    -following(F);
    +status_update;
    -target_reached(T).

+nearest_corner_intersection([X, Y, Z])
  <-
    N = [124, 0, 20]; # Norte
    O = [20, 0, 124]; # Oeste
    E = [240, 0, 124]; # Este
    S = [124, 0, 240]; # Sur

    DN = ((X - 124) * (X - 124)) + ((Z - 20) * (Z - 20)); # Distancia hasta el norte
    DO = ((X - 20) * (X - 10)) + ((Z - 124) * (Z - 124)); # Distancia hasta el oeste
    DE = ((X - 240) * (X - 240)) + ((Z - 124) * (Z - 124)); # Distancia hasta el este
    DS = ((X - 124) * (X - 124)) + ((Z - 240) * (Z - 240)); # Distancia hasta el sur

    Distances = [DN, DO, DE, DS];
    .min(Distances, D);
    +going_to_intersection;

    if (DN == D) {
      .goto(N);
    }
    if (DO == D) {
      .goto(O);
    }
    if (DE == D) {
      .goto(E);
    }
    if (DS == D) {
      .goto(S);
    }
    
    -nearest_corner_intersection([X, Y, Z]).
    
+friends_in_fov(ID, Type, Angle, Distance, Health, Position): not following(F) & not patrolling & health(H) & H > Health & ammo(A) & A >= Health
  <-
    # .print("Distancia: ", Distance);
    .shoot(3, Position);
    -enemy_search;
    -low_ammo;
    -low_health;
    -going_to_intersection;
    .look_at(Position);
    +following(Position);
    # .print("Enemigo Detectado en: ", Position);
    -friends_in_fov(ID, Type, Angle, Distance, Health, Position).

+friends_in_fov(ID, Type, Angle, Distance, Health, Position)
  <-
    .look_at(Position);
    .shoot(3, Position);
    -friends_in_fov(ID, Type, Angle, Distance, Health, Position).

+following([PX, PY,PZ])
  <-
    ?position([X, Y, Z]);

    if (X > PX) {
      DX = X - PX;
    }
    if (PX > X) {
      DX = PX - X;
    }
    if (PX == X) {
      DX = 1;
    }

    if (Z > PZ) {
      DZ = Z - PX;
    }
    if (PZ > Z) {
      DZ = PZ - Z;
    }
    if (PZ == Z) {
      DZ = 1;
    }
    
    .goto([X + 2 * ((PX - X) / DX), PY, Z + 2 * ((PZ - Z) / DZ)]).

+packs_in_fov(ID, Type, Angle, Distance, Health, Position): Type == 1001 & not goingForMedPack & low_health
  <-
    +goingForMedPack;
    # .print("Voy a por medicina");
    .goto(Position).

+packs_in_fov(ID, Type, Angle, Distance, Health, Position): Type == 1002 & not goingForAmmoPack & low_ammo
  <-
    +goingForAmmoPack;
    # .print("Voy a por municion");
    .goto(Position).

+packet_taken(TYPE, N)
  <-
    ?health(H);
    ?ammo(A);
    +status_update;
    -packet_taken(TYPE, N).
