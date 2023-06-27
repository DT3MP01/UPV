(define (problem examSOLVER3)
    (:domain examDomain3)
    (:objects
        zoneA - zone
        zoneB - zone
        zoneC - zone
        zoneD - zone
        zoneE - zone
        zoneF - zone

        order1 - package
        order2 - package
        order3 - package
        order4 - package
        order5 - package
        ; Ampliacion
        order6 - package
        order7 - package
        ;

        truck1 - combustion
        truck2 - combustion
        ; Ampliacion
        truck3 - combustion
        truck4 - combustion
        ;

        electric1 - electric
        electric2 - electric
    )
    (:init
        (= (km-combustion) 70)

        (= (distance zoneA zoneA) 0)
        (= (distance zoneA zoneB) 4)
        (= (distance zoneA zoneC) 6)
        (= (distance zoneA zoneD) 10)
        (= (distance zoneA zoneE) 52)
        (= (distance zoneA zoneF) 100)

        (= (distance zoneB zoneA) 4)
        (= (distance zoneB zoneB) 0)
        (= (distance zoneB zoneC) 4)
        (= (distance zoneB zoneD) 16)
        (= (distance zoneB zoneE) 20)
        (= (distance zoneB zoneF) 40)

        (= (distance zoneC zoneA) 6)
        (= (distance zoneC zoneB) 4)
        (= (distance zoneC zoneC) 0)
        (= (distance zoneC zoneD) 28)
        (= (distance zoneC zoneE) 55)
        (= (distance zoneC zoneF) 30)

        (= (distance zoneD zoneA) 10)
        (= (distance zoneD zoneB) 16)
        (= (distance zoneD zoneC) 28)
        (= (distance zoneD zoneD) 0)
        (= (distance zoneD zoneE) 30)
        (= (distance zoneD zoneF) 10)

        (= (distance zoneE zoneA) 52)
        (= (distance zoneE zoneB) 20)
        (= (distance zoneE zoneC) 55)
        (= (distance zoneE zoneD) 30)
        (= (distance zoneE zoneE) 0)
        (= (distance zoneE zoneF) 160)

        (= (distance zoneF zoneA) 100)
        (= (distance zoneF zoneB) 40)
        (= (distance zoneF zoneC) 30)
        (= (distance zoneF zoneD) 10)
        (= (distance zoneF zoneE) 160)
        (= (distance zoneF zoneF) 0)

        (isZle zoneA)
        (isZle zoneB)

        (isExchange zoneC)
        (isExchange zoneD)
        (isExchange zoneE)

        (packageInZone order1 zoneA)
        (packageInZone order2 zoneB)
        (packageInZone order3 zoneF)
        (packageInZone order4 zoneD)
        (packageInZone order5 zoneE)

        ; Ampliacion
        (packageInZone order6 zoneD)
        (packageInZone order7 zoneE)
        ;

        (vehicleInZone truck1 zoneC)
        (vehicleInZone truck2 zoneC)

        ; Ampliacion
        (vehicleInZone truck3 zoneD)
        (vehicleInZone truck4 zoneD)
        ;

        (vehicleInZone electric1 zoneB)
        (vehicleInZone electric2 zoneB)

        (= (balance) 40)

        (= (increasing-time) 1)
        (= (harvest-time) 1)
        (= (delivery-time) 2)
        (= (exchange-time) 3)

        (= (total-transport-trucks) 0) ; Ampliacion

    )
    (:goal
        (and
            (packageInZone order1 zoneF)
            (signed order1 zoneF)
            (packageInZone order2 zoneE)
            (signed order2 zoneF)
            (packageInZone order3 zoneD)
            (signed order3 zoneD)
            (packageInZone order4 zoneE)
            (signed order4 zoneE)
            (packageInZone order5 zoneA)
            (signed order5 zoneA)

            ; Ampliacion
            (packageInZone order6 zoneC)
            (signed order6 zoneC)
            (packageInZone order7 zoneF)
            (signed order7 zoneF)
        )
    )

    (:metric minimize
        (+ (* 0.2 (total-time)) (* 0.2 (balance)))
    )
)