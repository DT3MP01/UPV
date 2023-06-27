; Dominio Transporte
(define (domain transporte)
    (:requirements :durative-actions :typing :fluents :negative-preconditions)
    (:types
        combustion electric - vehicle
        zone
        package
    )

    (:predicates ; Verdadero o Falso
        (packageInZone ?p - package ?z - zone)
        (packageInVehicle ?p - package ?v - vehicle)
        (vehicleInZone ?v - vehicle ?z -zone)
        (isZLE ?z - zone)
        (isExchange ?z - zone)
        (verified ?p - package ?z - zone) ; Ampliacion
    )

    (:functions ; Numericas
        (km-combustion)
        (balance)
        (distance ?z1 - zone ?z2 - zone)
        (harvest-time)
        (delivery-time)
        (exchange-time)
        (increasing-time)
        (total-transport-vans)
    )

    (:durative-action combustionTransport
        :parameters (?v - combustion ?z1 ?z2 - zone)
        :duration (= ?duration (/ (distance ?z1 ?z2) 4))
        :condition (and
            (over all (not (isZLE ?z1)))
            (over all (not (isZLE ?z2)))
            (at start (vehicleInZone ?v ?z1))
            (at start (>= (km-combustion) (distance ?z1 ?z2)))
        )
        :effect (and
            (at start (not (vehicleInZone ?v ?z1)))
            (at end (vehicleInZone ?v ?z2))
            (at end (decrease (km-combustion) (distance ?z1 ?z2)))
        )
    )

    ; Ampliacion
    (:durative-action verificar-entrega
        :parameters (?p - package ?z - zone)
        :duration (= ?duration 1)
        :condition (and
            (over all (packageInZone ?p ?z))
        )
        :effect (and
            (at end (verified ?p ?z))
        )
    )
    ;

    (:durative-action electricTransport
        :parameters (?v - electric ?z1 ?z2 - zone)
        :duration (= ?duration (distance ?z1 ?z2))
        :condition (and
            (at start (vehicleInZone ?v ?z1))
        )
        :effect (and
            (at start (not (vehicleInZone ?v ?z1)))
            (at end (vehicleInZone ?v ?z2))
            (at start (increase (total-transport-vans) 1)) ; Ampliacion
        )
    )

    (:durative-action extendKm
        :parameters ()
        :duration (= ?duration (increasing-time))
        :condition (and
            (at start (>= (balance) 20))
        )
        :effect (and
            (at end (increase (km-combustion) 20))
            (at end (decrease (balance) 20))
        )
    )

    (:durative-action collectPackage
        :parameters (?p - package ?v - vehicle ?z - zone)
        :duration (= ?duration (harvest-time))
        :condition (and
            (at start (packageInZone ?p ?z))
            (over all (vehicleInZone ?v ?z))
        )
        :effect (and
            (at start (not (packageInZone ?p ?z)))
            (at end (packageInVehicle ?p ?v))
        )
    )

    (:durative-action deliverPackage
        :parameters (?p - package ?v - vehicle ?z - zone)
        :duration (= ?duration (delivery-time))
        :condition (and
            (at start (packageInVehicle ?p ?v))
            (over all (vehicleInZone ?v ?z))
        )
        :effect (and
            (at start (not (packageInVehicle ?p ?v)))
            (at end (packageInZone ?p ?z))
        )
    )

    (:durative-action exchange
        :parameters (?p -package ?v1 ?v2 - vehicle ?z - zone)
        :duration (= ?duration (exchange-time))
        :condition (and
            (over all (vehicleInZone ?v1 ?z))
            (over all (vehicleInZone ?v2 ?z))
            (at start (isExchange ?z))
            (at start (packageInVehicle ?p ?v1))
        )
        :effect (and
            (at start (not (packageInVehicle ?p ?v1)))
            (at end (packageInVehicle ?p ?v2))
        )
    )
)