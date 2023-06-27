// EJEMPLO LUCHADOR 

+flag(F)
  <-
    ?base(B);
    # Empiezo yendo a un lugar seguro
    C = [[114, 0, 124], [124, 0, 114], [134, 0, 124], [124, 0, 134]];
    +control_list(C);
    .length(C, L);
    +total_points(L);
    +nearest_corner_intersection(P).

+health(X): X > 80 & low_health
  <-
    -low_health;
    +status;
    .print("Me he curado").

+health(X): X < 60 & not low_health
  <-
    +low_health;
    +status;
    .print("Estoy mal de vida").

+ammo(X): X > 80 & low_ammo
  <-
    -low_ammo;
    +status;
    .print("Recargado").

+ammo(X): X < 60 & not low_ammo
  <-
    +low_ammo;
    .print("La municion escasea").

+point_search(P): total_points(T) & patrolling & P < T
  <-
    ?control_list(C);
    .nth(P, C, G);
    .print("Buscando paquetes en: ", G);
    .goto(G).

+point_search(P): total_points(T) & patrolling & P >= T
  <-
    -+point_search(0).

+target_reached(T): patrolling
  <-
    -goingForMedPack;
    -goingForAmmoPack;
    if (point_search(P)) {
      -+point_search(P + 1);
    }
    -target_reached(T).

+status: low_health & not patrolling
    <-
      +patrolling;
      +point_search(0);
      .print("Buscando vida");
      -status.

+status: low_ammo & not patrolling
    <-
      +patrolling;
      +point_search(0);
      .print("Buscando Municion");
      -status.

+status: not low_ammo & not low_health & patrolling
    <-
      ?position(P);
      if (point_search(P)) {
        -point_search(P);
      }
      -patrolling;
      +nearest_corner_intersection(P);
      .print("Volviendo al punto ", P);
      -status.

+target_reached(T): not patrolling
  <-
    ?position(P);
    .print("He llegado a: ", P);
    ?base(B);
    .look_at(B);
    -target_reached(T).

+nearest_corner_intersection([X, Y, Z])
  <-
    N = [124, 0, 10];
    O = [10, 0, 124];
    E = [245, 0, 124];
    S = [124, 0, 245];

    DN = ((X - 124) * (X - 124)) + ((Z - 10) * (Z - 10));
    DO = ((X - 10) * (X - 10)) + ((Z - 124) * (Z - 124));
    DE = ((X - 245) * (X - 245)) + ((Z - 124) * (Z - 124));
    DS = ((X - 124) * (X - 124)) + ((Z - 245) * (Z - 245));

    Distances = [DN, DO, DE, DS];
    .min(Distances, D);

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

+friends_in_fov(ID, Type, Angle, Distance, Health, Position)
  <-
    .shoot(3, Position).


+packs_in_fov(ID, Type, Angle, Distance, Health, Position): Type == 1001 & not goingForMedPack & low_health
  <-
    +goingForMedPack;
    .print("Voy a por medicina");
    .goto(Position).

+packs_in_fov(ID, Type, Angle, Distance, Health, Position): Type == 1002 & not goingForAmmoPack & low_ammo
  <-
    +goingForAmmoPack;
    .print("Voy a por municion");
    .goto(Position).

+packet_taken(TYPE, N): TYPE == 1001
  <-
    ?health(H);
    ?ammo(A);
    .print("He tomado el paquete medicina, necesito mas?", H, A);
    -packet_taken(TYPE, N).

+packet_taken(TYPE, N): TYPE == 1002
  <-
    ?health(H);
    ?ammo(A);
    .print("He tomado el paquete municion, necesito mas?", H, A);
    -packet_taken(TYPE, N).