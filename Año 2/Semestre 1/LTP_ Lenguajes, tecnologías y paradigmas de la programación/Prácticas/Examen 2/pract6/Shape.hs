type Side = Float
type Apothem = Float
type Radius = Float

data Shape = Pentagon Side Apothem | Circle Radius deriving (Eq, Show)

	perimeter :: Shape -> Float
	erimeter (Pentagon s a) = 5 * s
	perimeter (Circle r) = 2 * pi * r

	-- Ejercicio 6
	area :: Shape -> Float
	area (Pentagon s a) = perimeter (Pentagon s a) * a / 2
	area (Circle r) = pi * r * r
