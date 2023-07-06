(deftemplate VEHICULO
    (slot identificador (type SYMBOL))
    (slot distancia (type INTEGER))
    (slot velocidad (type INTEGER))
    (slot fuerza-aceleracion-momentum (type FLOAT))
    (slot fuerza-aceleracion-maximum (type FLOAT))
    (slot presion-freno-momentum (type FLOAT))
    (slot presion-freno-maximum (type FLOAT))
)

(deffunction fuzzify (?fztemplate ?value ?delta)
    (bind ?low (get-u-from ?fztemplate))
    (bind ?hi (get-u-to ?fztemplate))
    (if (<= ?value ?low)
        then
            (assert-string
            (format nil "(%s (%g 1.0) (%g 0.0))" ?fztemplate ?low ?delta))
        else
            (if (>= ?value ?hi)
            then
            (assert-string
            (format nil "(%s (%g 0.0) (%g 1.0))"
            ?fztemplate (- ?hi ?delta) ?hi))
            else
            (assert-string
            (format nil "(%s (%g 0.0) (%g 1.0) (%g 0.0))"
            ?fztemplate (max ?low (- ?value ?delta))
            ?value (min ?hi (+ ?value ?delta)) ))
        )))


(deftemplate distancia 0 50 metros ; definiciÃ³n de la variable fuzzy distancia
    ( (cerca (5 1) (15 0))
    (media (10 0) (20 1) (30 1) (35 0))
    (lejos (30 0) (35 1))))

(deftemplate velocidad -30 30 cm
    ((alejando (-30 1) (0 0))
    (constante (-10 0) (0 1) (15 0))
    (acercando (0 0) (30 1))))

(deftemplate fuerza-aceleracion 0 100 % 
    ((nula (0 0)(0 1) (0 0))
    (baja (5 1) (20 0))
    (media (10 0) (40 1) (60 1) (70 0))
    (alta (60 0) (100 1))))

(deftemplate presion-freno 0 100 %
    ((nula (0 0)(0 1) (0 0))
    (baja (5 1) (20 0))
    (media (10 0) (40 1) (60 1) (70 0))
    (alta (60 0) (100 1))))


(defrule cerca-alejando 
    (distancia cerca)
    (velocidad alejando)
    =>
        (assert (fuerza-aceleracion media))
        (assert (presion-freno nula)))

(defrule media-alejando 
    (distancia media)
    (velocidad alejando)
    =>
        (assert (fuerza-aceleracion more-or-less alta))
        (assert (presion-freno nula)))

(defrule lejos-alejando 
    (distancia lejos)
    (velocidad alejando)
    =>
        (assert (fuerza-aceleracion very alta))
        (assert (presion-freno nula)))


(defrule cerca-constante 
    (distancia cerca)
    (velocidad constante)
    =>
        (assert (fuerza-aceleracion nula))
        (assert (presion-freno very baja)))

(defrule media-constante 
    (distancia media)
    (velocidad constante)
    =>
        (assert (fuerza-aceleracion media))
        (assert (presion-freno nula)))

(defrule lejos-constante 
    (distancia lejos)
    (velocidad constante)
    =>
        (assert (fuerza-aceleracion alta))
        (assert (presion-freno nula)))


(defrule cerca-acercando 
    (distancia cerca)
    (velocidad acercando)
    =>
        (assert (fuerza-aceleracion nula))
        (assert (presion-freno alta)))

(defrule media-acercando 
    (distancia media)
    (velocidad acercando)
    =>
        (assert (fuerza-aceleracion nula))
        (assert (presion-freno more-or-less media)))

(defrule lejos-acercando 
    (distancia media)
    (velocidad acercando)
    =>
        (assert (fuerza-aceleracion very baja))
        (assert (presion-freno very baja)))


(defrule id
(initial-fact)
=>
    (printout t "Introduzca el id del vehicula" crlf)
    (bind ?identif (read))

    (printout t "Introduzca la distancia en metros" crlf)
    (bind ?dist (read))

    (printout t "Introduzca la velocidad en km/h" crlf)
    (bind ?speed (read))
    (assert ( VEHICULO ( identificador ?identif )( distancia ?dist )( velocidad ?speed )))
    (fuzzify velocidad ?speed 0)
    (fuzzify distancia ?dist 0)
)

(defrule seleccion
    (declare (salience -1) )
    ?v <- (VEHICULO ( identificador ?id) (distancia ?dis) (velocidad ?vel) (fuerza-aceleracion-momentum ?famo)
     (fuerza-aceleracion-maximum ?fama) (presion-freno-momentum ?pfmo) (presion-freno-maximum ?pfma))
    ?ac <- (fuerza-aceleracion ?)
    ?f <- (presion-freno ?)
    =>
        (printout t "Vehiculo" ?id crlf)
        (bind ?a (moment-defuzzify ?ac))
        (bind ?e (moment-defuzzify ?f))
        (bind ?i (maximum-defuzzify ?ac))
        (bind ?o (maximum-defuzzify ?f))
	(printout t "aceleracion max: " ?i crlf)
	(printout t "frenado max: " ?o crlf)
	(printout t "aceleracion mom : " ?a crlf)
	(printout t "frenado mom: " ?e crlf)
	(modify ?v (fuerza-aceleracion-momentum ?a ))
	(modify ?v (fuerza-aceleracion-maximum ?i ))
	(modify ?v (presion-freno-momentum ?e ))
	(modify ?v (presion-freno-maximum ?o ))
	(halt)
)

