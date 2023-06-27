type Side = Float
type Apothem = Float
type Radius = Float
type Height = Float
type Volume = Float
type Surface = Float

data Pentagon = Pentagon Side Apothem
data Circle = Circle Radius

class Shape a where
    perimeter :: a -> Float
    area :: a -> Float -- Ejercicio 7
	volumePrism :: (Shape a) => a -> Height -> Volume
	surfacePrism :: (Shape a) => a -> Height -> Surface
    
instance Shape Pentagon where
    perimeter (Pentagon s a) = 5 * s
    area (Pentagon s a) = perimeter (Pentagon s a) * a / 2
	volumePrism (Pentagon s a) h = 5 * s * a * h / 2
	surfacePrism figura h = (perimeter figura) + (h * 2)

instance Shape Circle where
    perimeter (Circle r) = 2 * pi * r
    area (Circle r) = pi * r * r
	volumePrism (Pentagon s a) h = 5 * s * a * h / 2

