(define (domain multimodal-mercancia)
(:requirements :durative-actions :typing :fluents :negative-preconditions)
(:types combustion electric - vehicle | zone | package - object )
(:predicates (at ?x - (either vehicle package) ?z - zone)
             (isExchange ?z - zone)
             (isZle ?z - zone )
             (in ?p - package ?v - vehicle)
             (deliver ?x - package ?z - zone))
(:functions (km-remaining)
            (distance ?z1 - zone ?z2 - zone)
            (remaining-money)
            (charging-time)
            (deliver-time)
            (exchange-time)
            (extend-time)
            )


(:durative-action chargePackage
 :parameters (?p - package ?v - vehicle ?z - zone)
 :duration (= ?duration (charging-time))
 :condition (and (at start (at ?p ?z))
                 (over all (at ?v ?z)))
 :effect (and (at start (not (at ?p ?z)))
              (at end (in ?p ?v))))

(:durative-action DeliverPackage
 :parameters (?p - package ?v - vehicle ?z - zone)
 :duration (= ?duration (deliver-time))
 :condition (and (at start (in ?p ?v))
                 (over all (at ?v ?z)))
 :effect (and (at start (not (in ?p ?v)))
              (at end (deliver ?p ?z ))))

(:durative-action exchangePackage
 :parameters (?p - package ?v1 ?v2 - vehicle ?z - zone)
 :duration (= ?duration (exchange-time))
 :condition (and (at start (in ?p ?v1))
                 (over all (isExchange ?z))
                 (over all (at ?v1 ?z))
                 (over all (at ?v2 ?z)))
 :effect (and (at start (not (in ?p ?v1)))
              (at end (in ?p ?v2 ))))


(:durative-action travelCombustion 
 :parameters (?v - combustion ?z1 ?z2 - zone)
 :duration (= ?duration (/ (distance ?z1 ?z2) 4))
 :condition (and (at start (at ?v ?z1))
                 (over all (not (isZle ?z2) ))
                 (at start (>= (km-remaining) (distance ?z1 ?z2) ) )
                 )
 :effect (and (at start (not (at ?v ?z1)))
              (at end (at ?v ?z2))
              (at end (decrease (km-remaining) (distance ?z1 ?z2) ) )
              )) 

(:durative-action travelElectric 
 :parameters (?v - electric ?z1 ?z2 - zone)
 :duration (= ?duration (distance ?z1 ?z2))
 :condition (and (at start (at ?v ?z1))
                 )
 :effect (and (at start (not (at ?v ?z1)))
              (at end (at ?v ?z2))
              )) 

(:durative-action extendTime
 :parameters ()
 :duration (= ?duration (extend-time))
 :condition (and (at start (>= (remaining-money) 20))
                 )
 :effect (and (at end (increase (km-remaining) 20) )
              (at end (decrease (remaining-money) 20) )
              ))

)