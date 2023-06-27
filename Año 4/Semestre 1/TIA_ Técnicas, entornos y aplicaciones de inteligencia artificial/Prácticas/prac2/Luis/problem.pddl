(define (problem TRANSPORT)
	(:domain multimodal-mercancia)
	(:objects
		combustible1 - combustion
		combustible2 - combustion
		electrico1 - electric
		electrico2 - electric
		pedido1 - package
		pedido2 - package
		pedido3 - package
		pedido4 - package
		pedido5 - package
		zona-A - zle
		zona-B - zle
		zona-C - znormal
		zona-D - znormal
		zona-E - znormal
		zona-F - znormal
		zintercambio - exchange
	)
	(:init
		(at combustible1 zona-C)
		(at combustible2 zona-C)
		(at electrico1 zona-B)
		(at electrico2 zona-B)

		(packat pedido1 zona-A)
		(packat pedido2 zona-B)
		(packat pedido3 zona-F)
		(packat pedido4 zona-D)
		(packat pedido5 zona-E)

		(is zona-C zintercambio)
		(is zona-D zintercambio)
		(is zona-E zintercambio)

		(= (distance zona-A zona-A) 0)
		(= (distance zona-A zona-B) 4)
		(= (distance zona-A zona-C) 6)
		(= (distance zona-A zona-D) 10)
		(= (distance zona-A zona-E) 52)
		(= (distance zona-A zona-F) 100)

		(= (distance zona-B zona-A) 4)
		(= (distance zona-B zona-B) 0)
		(= (distance zona-B zona-C) 4)
		(= (distance zona-B zona-D) 16)
		(= (distance zona-B zona-E) 20)
		(= (distance zona-B zona-F) 40)

		(= (distance zona-C zona-A) 6)
		(= (distance zona-C zona-B) 4)
		(= (distance zona-C zona-C) 0)
		(= (distance zona-C zona-D) 28)
		(= (distance zona-C zona-E) 55)
		(= (distance zona-C zona-F) 30)

		(= (distance zona-D zona-A) 10)
		(= (distance zona-D zona-B) 16)
		(= (distance zona-D zona-C) 28)
		(= (distance zona-D zona-D) 0)
		(= (distance zona-D zona-E) 30)
		(= (distance zona-D zona-F) 10)

		(= (distance zona-E zona-A) 52)
		(= (distance zona-E zona-B) 20)
		(= (distance zona-E zona-C) 55)
		(= (distance zona-E zona-D) 30)
		(= (distance zona-E zona-E) 0)
		(= (distance zona-E zona-F) 160)

		(= (distance zona-F zona-A) 100)
		(= (distance zona-F zona-B) 40)
		(= (distance zona-F zona-C) 30)
		(= (distance zona-F zona-D) 10)
		(= (distance zona-F zona-E) 160)
		(= (distance zona-F zona-F) 0)

		(= (remainig-money) 40)
		(= (km-remaining) 70)

		(= (charging-time) 1)
		(= (extend-time) 1)
		(= (discharge-time) 2)
		(= (exchange-time) 3)

	)
	(:goal
		(and
			(deliver pedido1 zona-F)
			(deliver pedido2 zona-E)
			(deliver pedido3 zona-D)
			(deliver pedido4 zona-E)
			(deliver pedido5 zona-A)
		)
	)

	(:metric minimize
		(+ (* 0.8 (total-time)) (* 0.2 (remainig-money)))
	)
)