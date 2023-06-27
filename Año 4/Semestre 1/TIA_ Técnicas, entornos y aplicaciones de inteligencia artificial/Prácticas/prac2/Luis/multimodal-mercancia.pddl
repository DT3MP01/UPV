(define (domain multimodal-mercancia)
    (:requirements :durative-actions :typing :fluents)
    (:types
        combustion electric - vehicle
        znormal zle - zone
        package
        exchange
    )
    (:predicates
        (at ?x - vehicle ?z - zone)
        (packat ?x - package ?z - zone)
        (is ?z - zone ?e - exchange)
        (in ?p - package ?v - vehicle)
        (deliver ?x - package ?z - zone)
    )
    (:functions
        (km-remaining)
        (distance ?z1 - zone ?z2 - zone)
        (remainig-money)
        (charging-time)
        (discharge-time)
        (exchange-time)
        (extend-time)
    )

    (:durative-action chargePackage
        :parameters (?p - package ?v - vehicle ?z - zone)
        :duration (= ?duration (charging-time))
        :condition (and (at start (packat ?p ?z))
            (over all (at ?v ?z)))
        :effect (and (at start (not (packat ?p ?z)))
            (at end (in ?p ?v)))
    )

    (:durative-action DeliverPackage
        :parameters (?p - package ?v - vehicle ?z - zone)
        :duration (= ?duration (discharge-time))
        :condition (and (at start (in ?p ?v))
            (over all (at ?v ?z)))
        :effect (and (at start (not (in ?p ?v)))
            (at end (deliver ?p ?z)))
    )

    (:durative-action exchangePackage
        :parameters (?p - package ?v1 ?v2 - vehicle ?z - zone ?e - exchange)
        :duration (= ?duration (exchange-time))
        :condition (and (at start (in ?p ?v1))
            (over all (is ?z ?e))
            (over all (at ?v1 ?z))
            (over all (at ?v2 ?z)))
        :effect (and (at start (not (in ?p ?v1)))
            (at end (in ?p ?v2)))
    )

    (:durative-action travelCombustion
        :parameters (?v - combustion ?z1 ?z2 - znormal)
        :duration (= ?duration (/ (distance ?z1 ?z2) 4))
        :condition (and (at start (at ?v ?z1))
            (at start (>= (km-remaining) (distance ?z1 ?z2)))
        )
        :effect (and (at start (not (at ?v ?z1)))
            (at end (at ?v ?z2))
            (at end (decrease (km-remaining) (distance ?z1 ?z2) ))
        )
    )

    (:durative-action travelElectric
        :parameters (?v - electric ?z1 ?z2 - zone)
        :duration (= ?duration (distance ?z1 ?z2))
        :condition (and (at start (at ?v ?z1))
        )
        :effect (and (at start (not (at ?v ?z1)))
            (at end (at ?v ?z2))
        )
    )

    (:durative-action extendTime
        :parameters ()
        :duration (= ?duration (extend-time))
        :condition (and (at start (>= remainig-money 20))
        )
        :effect (and (at end (increase km-remaining 20))
            (at end (decrease remainig-money 20))
        )
    )

)