; Clase vehículo

(deftemplate vehiculo
    (slot id (type SYMBOL))
    (slot distancia-crisp (type INTEGER))
    (slot velocidad-crisp (type INTEGER))
    (slot potencia (type INTEGER)) ; Ampliacion
    (slot fuerza-aceleracion_momentum (type FLOAT))
	(slot fuerza-aceleracion_maximum (type FLOAT))
    (slot presion-freno_momentum (type FLOAT))
	(slot presion-freno_maximum (type FLOAT))
)

; Variables difusas
(deftemplate distancia-crisp
    0 50 m
(
    (cerca (5 1) (15 0))
    (medio (10 0) (20 1) (30 1) (35 0))
    (lejos (30 0) (35 1)))
)

(deftemplate velocidad-crisp
    -30 30 km
(
    (alejando (-30 1) (0 0))
    (constante (-10 0) (0 1) (15 0))
    (acercando (0 0) (30 1)))
)

(deftemplate fuerza-aceleracion
    0 100 %
(
    (nula (0 0) (0 1) (0 0))
    (baja (5 1) (20 0))
    (media (10 0) (40 1) (60 1) (70 0))
    (alta (60 0) (100 1)))
)

(deftemplate presion-freno
    0 100 %
(
    (nula (0 0) (0 1) (0 0))
    (baja (5 1) (20 0))
    (media (10 0) (40 1) (60 1) (70 0))
    (alta (60 0) (100 1)))
)

; Ampliacion
(deftemplate visibilidad
    0 100 grados
(
    (baja (25 1) (35 0))
    (media (30 0) (35 1) (65 1) (75 0))
    (alta (65 0) (80 1)))
)
;

; Fuzzification
(deffunction fuzzify (?fztemplate ?value ?delta)
    (bind ?low (get-u-from ?fztemplate))
    (bind ?hi (get-u-to ?fztemplate))

    (if (<= ?value ?low)
        then
            (assert-string (format nil "(%s (%g 1.0) (%g 0.0))" ?fztemplate ?low ?delta))
        else
            (if (>= ?value ?hi)
                then
                    (assert-string (format nil "(%s (%g 0.0) (%g 1.0))" ?fztemplate (- ?hi ?delta) ?hi))
                else
                    (assert-string (format nil "(%s (%g 0.0) (%g 1.0) (%g 0.0))" ?fztemplate (max ?low (- ?value ?delta)) ?value (min ?hi (+ ?value ?delta)) ))
            )
    )
)

; Keyboard input
(defrule main
    (initial-fact)
=>  
    (printout t crlf "Introduce el ID del vehículo:" crlf) ; Reading a crisp value
    (bind ?id (read))

    (printout t "Introduce la distancia-crisp al vehículo de delante:" crlf) ; Reading a crisp value y se fusifica (y aserta)
    (bind ?distancia (read))
    (fuzzify distancia-crisp ?distancia 0)

    (printout t "Introduce la velocidad-crisp relativa:" crlf) ; leemos un valor crisp y se fusifica (y aserta)
    (bind ?velocidad (read))
    (fuzzify velocidad-crisp ?velocidad 0)

    ; Ampliacion examen
    (printout t "Introduce la visibilidad:" crlf)
    (bind ?vis (read))
    (fuzzify visibilidad ?vis 0)
    ;

    (assert (vehiculo (id ?id) (distancia-crisp ?distancia) (velocidad-crisp ?velocidad)))
)

(defrule r1
    (distancia-crisp cerca)
    (velocidad-crisp alejando)
=>
    (assert (fuerza-aceleracion media))
    (assert (presion-freno nula))
)

(defrule r2
    (distancia-crisp medio)
    (velocidad-crisp alejando)
=>
    (assert (fuerza-aceleracion more-or-less alta))
    (assert (presion-freno nula))
)

(defrule r3
    (distancia-crisp lejos)
    (velocidad-crisp alejando)
=>
    (assert (fuerza-aceleracion very alta))
    (assert (presion-freno nula))
)

(defrule r4
    (distancia-crisp cerca)
    (velocidad-crisp constante)
=>
    (assert (fuerza-aceleracion nula))
    (assert (presion-freno very baja))
)

(defrule r5
    (distancia-crisp medio)
    (velocidad-crisp constante)
=>
    (assert (fuerza-aceleracion media))
    (assert (presion-freno nula))
)

(defrule r6
    (distancia-crisp lejos)
    (velocidad-crisp constante)
=>
    (assert (fuerza-aceleracion alta))
    (assert (presion-freno nula))
)

(defrule r7
    (distancia-crisp cerca)
    (velocidad-crisp acercando)
=>
    (assert (fuerza-aceleracion nula))
    (assert (presion-freno alta))
)

(defrule r8
    (distancia-crisp medio)
    (velocidad-crisp acercando)
=>
    (assert (fuerza-aceleracion nula))
    (assert (presion-freno more-or-less media))
)

(defrule r9
    (distancia-crisp lejos)
    (velocidad-crisp acercando)
=>
    (assert (fuerza-aceleracion very baja))
    (assert (presion-freno very baja))
)

; Ampliacion

(defrule r10
    (distancia-crisp lejos)
    (visibilidad alta)
=>
    (assert (presion-frenado more-or-less baja))
)

; Ampliacion

(defrule r11
    (distancia-crisp cerca)
    (visibilidad baja)
=>
    (assert (fuerza-aceleracion baja))
)

; Ampliacion

(defrule decisive
    ?veh <- (vehiculo (id ?myID) (distancia-crisp ?distancia) (velocidad-crisp ?velocidad) (potencia ?po) 
    (fuerza-aceleracion_momentum ?famo) (fuerza-aceleracion_maximum ?fama) (presion-freno_momentum ?pfmo)
    (presion-freno_maximum ?pfma))
    
    (test (> ?po 200))
    (fuerza-aceleracion ?fuerza)
    (test (> (moment-defuzzify ?fuerza) 70))
=>
    (printout t "Situación Crítica: peligro de desplazamiento" crlf)
)

;

; Defuzzification
(defrule defuzzify
    (declare (salience -1))
    ?val1 <- (fuerza-aceleracion ?fa)
    ?val2 <- (presion-freno ?pf)
    ?veh <- (vehiculo (id ?id) (distancia-crisp ?dc) (velocidad-crisp ?vc) 
    (fuerza-aceleracion_momentum ?famo1) (fuerza-aceleracion_maximum ?fama1) 
    (presion-freno_momentum ?pfmo1) (presion-freno_maximum ?pfma1))
=>
    (bind ?famo (moment-defuzzify ?val1))
    (bind ?fama (maximum-defuzzify ?val1))
    (bind ?pfmo (moment-defuzzify ?val2))
    (bind ?pfma (maximum-defuzzify ?val2))

    (modify ?veh (fuerza-aceleracion_momentum ?famo) (fuerza-aceleracion_maximum ?fama) 
    (presion-freno_momentum ?pfmo) (presion-freno_maximum ?pfma))

    (printout t "fuerza-aceleracion por momentum: " ?famo crlf)
    (printout t "fuerza-aceleracion por maximum: " ?fama crlf crlf)

    (printout t "presion-freno por momentum: " ?pfmo crlf)
    (printout t "presion-freno por maximum: " ?pfma crlf crlf)

    (halt)
)