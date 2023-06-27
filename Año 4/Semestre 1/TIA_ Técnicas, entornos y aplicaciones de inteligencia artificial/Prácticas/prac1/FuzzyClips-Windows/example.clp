(deffunction fuzzify (?fztemplate ?value ?delta)

        (bind ?low (get-u-from ?fztemplate))
        (bind ?hi  (get-u-to   ?fztemplate))

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
            )
        )
  )

(deftemplate edad  ; Variable difusa
    0 100 años ; Universo 
( 
    (joven (10 0) (15 1) (25 1) (30 0)) ; Valores difusos
    (veinticinco (25 0) (25 1) (25 0)) ; (fuzzify edad 25 0)
    (adulta (20 0) (30 0.7) (40 1) (60 0.7) (70 0))
    (madura (60 0) (70 1)))
)

(deffacts ejemplo 
    (edad veinticinco)
)

(deftemplate estatura ; Variable difusa
    0 250 cm ; Universo 
(
    (bajo (0 1) (100 1) (150 0)) ; Valores difusos
    (medio (100 0) (150 1) (170 1) (180 0))
    (alto (170 0) (180 1)))
)

(defrule edades
    (edad adulta)
=>
    (printout t "Los adultos son altos" crlf)
    (assert (estatura alto))
)

; Asignadas las variables y los valores difusos, podemos declarar hechos difusos
; (assert (edad adulta))
; (assert (estatura very alto))

(deftemplate grupo 
    0 20 miembros
(
    (pocos (3 1) (6 0))
    (muchos (4 0) (6 1)))
) 

; (assert (grupo pocos))
; (assert (grupo (1 0) (5 1) (7 0)) ) ;Nuevo valor
; (assert (grupo NOT [ very pocos OR muchos ] )) ;es necesario dejar un espacio junto a [ y ]
; (assert (grupo (z 4 8)))

; Función para asertar valor difuso por consola

(defrule leerconsola ;lee de consola un valor crisp y aserta su valor fusificado
    (initial-fact)
=>
    (printout t "Introduzca la edad en anyos" crlf)
    (bind ?Redad (read))
    (fuzzify edad ?Redad 0.1)
)

; (defrule leerconsola ;lee de consola valor crisp y aserta su valor fuzzy singleton
; (initial-fact)
; =>
; (printout t "Introduzca la edad en anyos" crlf)
; (bind ?Redad (read))
; (assert (edad (?Redad 0) (?Redad 1) (?Redad 0))))

(deftemplate tanque 
    0 80 litros
(
    (bajo (10 1)(30 0))
    (medio (20 0)(35 1)(45 1)(60 0))
    (alto (50 0)(70 1)))
)

; (assert (tanque plus alto))

(defrule danger
    (tanque extremely alto)
=>
    (printout t "El tanque puede desbordarse. PELIGRO!" crlf)
    (assert (alarma))
)

(deftemplate Temp 
    5 50 Celsius
(
    (frio (z 10 20))
    (templado (pi 5 25))
    (calor (s 30 40)))
)

(deftemplate valvula 
    0 90 grados-apertura
(
    (poco (z 10 30))
    (medio (pi 30 45))
    (mucho (s 70 80)))
)

(defrule hace_frio
    (Temp frio)
=>
    (assert (valvula mucho))
)

(defrule temperatura_buena
    (Temp templado)
=>
    (assert (valvula medio))
)

(defrule hace_calor
    (Temp calor)
=>
    (assert (valvula poco))
)

(deffacts ejemplo
    (Temp very templado)
)

(defrule defuzzificar
    (valvula ?val)
=>
    (printout T "Apertura Valvula por moment: " (moment-defuzzify ?val) crlf)
    (printout T " Apertura Valvula por maximum: " (maximum-defuzzify ?val) crlf)
)

(defrule fuzzy1
    (edad ?f)
=> 
    (bind ?e (maximum-defuzzify ?f))
    (printout t "En fuzzy1, edad es " ?e crlf)
)

(defrule fuzzy2
    (edad ?f)
=> 
    (bind ?e (moment-defuzzify ?f))
    (printout t " En fuzzy2, edad es " ?e crlf)
)

(deftemplate aptitud ; aptitud para jugar al baloncesto
    0 10 unidades
(
    (baja (0 1) (5 0))
    (media (3 0) (4 1) (6 1) (10 0))
    (alta (5 0) (10 1)))
)

(defrule basket ; asignar_aptitud_jugar_baloncesto
    (edad joven)
    (estatura alto)
=>
    (assert (aptitud alta))
)

(defrule defusificar
    ?f <- (aptitud ?)
=> 
    (bind ?e (maximum-defuzzify ?f))
    (printout t "Aptitud es " ?e crlf)
)

(deffacts fuzzy-fact
    (edad adulta)
    (estatura very alto)
)