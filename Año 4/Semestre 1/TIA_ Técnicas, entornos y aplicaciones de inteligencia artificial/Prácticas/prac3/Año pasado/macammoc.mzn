include "macammoc_datos.dzn";
include "alldifferent.mzn"; 

int: N_Tareas_Adam; % Número de tareas de Adam
int: N_Tareas_Eva; % Número de tareas de Eva
int: Desplazamiento; % Tiempo de desplazamiento de Adam

% NOTA: Las horas de inicio y fin se representan como su valor total en minutos
array [1..N_Tareas_Adam] of var int: Duracion_Adam; % Duración tareas de Adam
array [1..N_Tareas_Eva] of var int: Duracion_Eva; % Duración tareas de Eva
array [1..N_Tareas_Adam] of var int: Inicio_Adam; % Inicio tareas de Adam
array [1..N_Tareas_Eva] of var int: Inicio_Eva; % Inicio tareas de Eva
array [1..N_Tareas_Adam] of var int: Fin_Adam; % Fin tareas de Adam
array [1..N_Tareas_Eva] of var int: Fin_Eva; % Fin tareas de Eva

enum Tareas_Adam = {TINTORERIA, PELUQUERIA, PAQUETE, REGALO_A}; % Nombre de las tareas de Adam
enum Tareas_Eva = {FARMACIA, AMIGA, REGALO_E}; % Nombre de las tareas de Eva

% RESTRICCIONES Adam 
% Inicio
constraint forall(i in 1..N_Tareas_Adam) (Inicio_Adam[i] >= (10 * 60 + Desplazamiento)); % hora actual
constraint forall(i in 1..N_Tareas_Adam) (Inicio_Adam[i] < Fin_Adam[i]);
constraint forall(i in 1..N_Tareas_Adam) (Fin_Adam[i] = Inicio_Adam[i] + Duracion_Adam[i]);
constraint forall(i, j in 1..N_Tareas_Adam where i != j) (if Inicio_Adam[j] > Inicio_Adam[i] then Inicio_Adam[j] >= Fin_Adam[i] + Desplazamiento endif);
constraint alldifferent(Inicio_Adam);

% Tintoreria
constraint (
  (Inicio_Adam[1] >= (9 * 60 + Desplazamiento) /\ (Fin_Adam[1] <= (13 * 60) + Duracion_Adam[1])) \/ 
  (Inicio_Adam[1] >= (17 * 60 + Desplazamiento) /\ (Fin_Adam[1] <= (20 * 60) + Duracion_Adam[1]))
);

% Peluqueria
constraint (
  (Inicio_Adam[2] >= (12 * 60) /\ Inicio_Adam[2] <= (14 * 60 + 30)) \/ 
  (Inicio_Adam[2] >= (16 * 60 + 30) /\ Inicio_Adam[2] <= (18 * 60 + 30))
);

% Paquete
constraint (
  (Inicio_Adam[3] >= (14 * 60) /\ Inicio_Adam[3] <= (17 * 60)) \/ 
  (Inicio_Adam[3] >= (18 * 60) /\ Inicio_Adam[3] <= (21 * 60 + 30))
);

% Regalo
constraint (Inicio_Adam[4] >= (9 * 60) /\ Inicio_Adam[4] <= (21 * 60));

% Aeropuerto
constraint forall(i in 1..N_Tareas_Adam) (Fin_Adam[i] <= (19 * 60 + 30 - Desplazamiento));


% RESTRICCIONES Eva
% Inicio
constraint forall(i in 1..N_Tareas_Eva) (Inicio_Eva[i] >= (12 * 60 + 30));
constraint forall(i in 1..N_Tareas_Eva) (Inicio_Eva[i] < Fin_Eva[i]);
constraint forall(i in 1..N_Tareas_Eva) (Fin_Eva[i] = Inicio_Eva[i] + Duracion_Eva[i]);
constraint forall(i, j in 1..N_Tareas_Eva where i != j) (if Inicio_Eva[j] > Inicio_Eva[i] then Inicio_Eva[j] >= Fin_Eva[i] + Desplazamiento endif);
constraint alldifferent(Inicio_Eva);

% Farmacia
constraint (
  ((Inicio_Eva[1] <= (17 * 60)) /\ (Fin_Eva[1] >= Inicio_Eva[1] + (2 * 60 + 30))) \/ 
  ((Inicio_Eva[1] > (17 * 60)) /\ (Fin_Eva[1] = Inicio_Eva[1] + Duracion_Eva[1]))
);

% Amiga
constraint (
  ((Inicio_Eva[2] >= (12 * 60)) /\ (Fin_Eva[2] <= (13 * 60 + 30) + Duracion_Eva[2])) \/ 
  ((Inicio_Eva[2] >= (17 * 60 + 30) /\ (Fin_Eva[2] <= (18 * 60 + 30) + Duracion_Eva[2])))
);
% ¿Es posible que visite 4h antes? (SÍ)
% constraint Fin_Eva[2] <= Inicio_Adam[2] - (4 * 60);
% ¿Es posible que visite 5h antes? (SÍ)
% constraint Fin_Eva[2] <= Inicio_Adam[2] - (5 * 60);


% Restricciones conjuntas
% Regalo
constraint Inicio_Adam[4] == Inicio_Eva[3] /\ Fin_Adam[4] == Fin_Eva[3];

% [Opcional - Intervalos de tiempo de 30min]
% constraint forall(i in 1..N_Tareas_Adam) (Inicio_Adam[i] mod 30 == 0);
% constraint forall(i in 1..N_Tareas_Eva) (Inicio_Eva[i] mod 30 == 0);

% Soluciones factibles
% solve satisfy;
% Mayor holgura de Adam para ir al aeropuerto (Como pronto, a las 17:00, unas 2:30h de holgura)
% solve minimize max(Fin_Adam);
% Hora más temprana para Ana (Como pronto, a las 18:30)
% solve minimize max(Fin_Eva);
% Hora más tardía de Adam (Como tarde, a las 13:00 de casa)
solve maximize min(Inicio_Adam);

output 
  ["ADAM\n"] ++
  ["Tarea \(Tareas_Adam[i]) comienza a las \(Inicio_Adam[i] / 60) y acaba a las \(Fin_Adam[i] / 60)\n" | i in 1..N_Tareas_Adam] ++               ["Estará en el aeropuerto, como muy pronto, a las \((max(Fin_Adam) + Desplazamiento) / 60)\n"] ++
  ["\nEVA\n"] ++
  ["Tarea \(Tareas_Eva[i]) comienza a las \(Inicio_Eva[i] / 60) y acaba a las \(Fin_Eva[i] / 60)\n" | i in 1..N_Tareas_Eva] ++
  ["Estará en su casa, como muy pronto, a las \((max(Fin_Eva) + Desplazamiento) / 60)\n"];