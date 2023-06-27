(defglobal ?*nod-gen* = 0)

(defrule right
        (pos ?x ?y box $?aa enemy $?bb shots ?z level ?l)
        (gap $?gg)
        (tam ?x1 ?y1)
        (max-level ?max)
        
        (test (< ?l  ?max))
        (test (<= (+ ?x 1) ?x1))
        (test (not (member$ (create$ e (+ ?x 1) ?y) $?bb)))
        (test (not (member$ (create$ g (+ ?x 1) ?y) $?gg)))
=>
        (bind ?*nod-gen* (+ ?*nod-gen* 1))
        (assert (pos (+ ?x 1) ?y box $?aa enemy $?bb shots ?z level (+ ?l 1)))
)


(defrule left
        (pos ?x ?y box $?aa enemy $?bb shots ?z level ?l)        
        (gap $?gg)
        (max-level ?max)
        
        (test (< ?l  ?max))
        (test (> (- ?x 1) 0))
        (test (not (member$ (create$ e (- ?x 1) ?y) $?bb)))
        (test (not (member$ (create$ g (- ?x 1) ?y) $?gg)))
=>
        (bind ?*nod-gen* (+ ?*nod-gen* 1))
        (assert (pos (- ?x 1) ?y box $?aa enemy $?bb shots ?z level (+ ?l 1)))
)


(defrule up
        (pos ?x ?y box $?aa enemy $?bb shots ?z level ?l)
        (ladder $?ll)
        (tam ?x1 ?y1)
        (max-level ?max)
        
        (test (< ?l  ?max))
        (test (member$ (create$ l ?x ?y) $?ll))
        (test (<= (+ ?y 1) ?y1))
=>
        (bind ?*nod-gen* (+ ?*nod-gen* 1))
        (assert (pos ?x (+ ?y 1) box $?aa enemy $?bb shots ?z level (+ ?l 1)))
)


(defrule down
        (pos ?x ?y box $?aa enemy $?bb shots ?z level ?l)        
        (ladder $?ll)
        (tam ?x1 ?y1)
        (max-level ?max)
        
        (test (< ?l ?max))
        (test (member$ (create$ l ?x (- ?y 1)) $?ll))
        (test (> (- ?y 1) 0))
=>
        (bind ?*nod-gen* (+ ?*nod-gen* 1))
        (assert (pos ?x (- ?y 1) box $?aa enemy $?bb shots ?z level (+ ?l 1)))
)


(defrule shoot
        (pos ?x ?y box $?aa enemy $?bb e ?xe ?xy $?be shots ?z level ?l)
        (max-level ?max)

        (test (< ?l ?max))
        (test (> ?z 0))
        (or (test (= (+ ?x 1) ?xe)) (test (= (- ?x 1) ?xe)))
        (test (= ?y ?xy)) 
=>
        (bind ?*nod-gen* (+ ?*nod-gen* 1))
        (assert (pos ?x ?y box $?aa enemy $?bb $?be shots (- ?z 1) level (+ ?l 1)))
)


(defrule catch
        (pos ?x ?y box $?aa b ?xb ?yb $?ae enemy $?bb shots ?z level ?l)
        (max-level ?max)
        
        (test (< ?l  ?max))
        (test (= ?x ?xb))
        (test (= ?y ?yb))
=>
        (bind ?*nod-gen* (+ ?*nod-gen* 1))
        (assert (pos ?x ?y box $?aa $?ae enemy $?bb shots ?z level (+ ?l 1)))
)


(defrule goal
        (declare(salience 10))

        (pos ?x ?y box enemy shots ?z level ?l)
        
=>
        (printout t "Solucion Encontrada en el Nivel: " ?l ", 
	
	Numero de Nodos expandidos: "?*nod-gen* crlf)

	(printout t "Los disparos que quedan son:" ?z crlf)

        (halt)
)


(defrule lost
    (declare (salience -10))
=>
    (printout t "Solucion no encontrada,

    Numero de Nodos expandidos: " ?*nod-gen* crlf)

    (halt)
)

(defrule right_jump
    (pos ?x ?y box $?aa enemy $?bb shots ?z level ?l)

    (gap $?gg)
    (tam ?x1 ?y1)
    (max-level ?max)

    (test (< ?l  ?max))
    (test (<= (+ ?x 2) ?x1))
    (test (member$ (create$ g (+ ?x 1) ?y) $?gg))
    (test (not (member$ (create$ e (+ ?x 2) ?y) $?bb)))
    (test (not (member$ (create$ g (+ ?x 2) ?y) $?gg)))
=>
    (bind ?nod-gen (+ ?nod-gen 1))
    (assert (pos (+ ?x 2) ?y box $?aa enemy $?bb shots ?z level (+ ?l 1)))
)

(deffunction start()
        (reset)
        (printout t "Introduce la Profundidad Maxima:= ")
        (bind ?prof (read))
        (printout t "Introduce el Tipo de Busqueda " crlf "    1.- Anchura" crlf "    2.- Profundidad" crlf)
        (bind ?a (read))
        (if (= ?a 1)
               then    (set-strategy breadth)
               else   (set-strategy depth))
        (printout t " Ejecuta run para poner en marcha el programa " crlf)

        (assert (pos 7 2 box b 2 1 b 12 3 b 13 2 b 7 2 enemy e 4 2 e 8 2 e 5 2 e 6 2 shots 4 level 0))
        (assert (ladder l 2 3 l 2 2 l 1 3 l 10 2 l 7 1 l 11 3))
        (assert (gap g 4 2 g 3 3 g 6 3 g 5 4))
        (assert (tam 13 4))
        (assert (max-level ?prof))
)