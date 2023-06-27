module Pract5 where

-- Ejercicio 1
decBin :: Int -> [Int]
decBin x = if x < 2 then [x] 
            else (x `mod` 2) : decBin (x `div` 2)
            
-- Ejercicio 2
binDec :: [Int] -> Int
binDec (x:[]) = x
binDec (x:y) = x + binDec y * 2

-- Ejercicio 3
divisors :: Int -> [Int]
divisors x = [ns | ns <- [1..x], mod x ns == 0]

-- Ejercicio 4
member :: Int -> [Int] -> Bool
member x [] = False
member x (n:ns)
    | x == n = True
    | otherwise = member x ns

-- Ejercicio 5
isPrime :: Int -> Bool
isPrime x = length (divisors x) == 2 || x == 1

primes :: Int -> [Int]
primes x = take x [ns | ns <- [1..], isPrime ns] 

-- Ejercicio 6
selectEven :: [Int] -> [Int]
selectEven ns = [xs | xs <- ns, mod xs 2 == 0]                                                                                                         

-- Ejercicio 7
selectEvenPos :: [Int] -> [Int]
selectEvenPos [] = []
selectEvenPos [x] = [x]
selectEvenPos (x:y:ns) = x : selectEvenPos ns

-- Ejercicio 8
iSort :: [Int] -> [Int]
iSort [] = []
iSort [x] = [x]
iSort (x:ns) = ins x (iSort ns)

ins :: Int -> [Int] -> [Int]
ins x [] = [x]
ins x (y:ns) = if x > y then (y : ins x ns) else (x:y:ns)

-- Ejercicio 9
doubleAll :: [Int] -> [Int]
doubleAll ns = map (2*) ns

-- Ejercicio 10
map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f xs = [f x | x <- xs]

filter' :: (a -> Bool) -> [a] -> [a]
filter' p [] = []
filter' p (x:xs) = [x | x <- xs, p x]

-- Ejercicio 11
type Person = String
type Book = String
type Database = [(Person,Book)]

exampleBase :: Database
exampleBase = [("Alicia", "El nombre de la rosa"), ("Juan", "La hija del canibal"),("Pepe","Odesa"), ("Alicia","La ciudad de las bestias")]

obtain :: Database -> Person -> [Book]
obtain dBase thisPerson 
 = [book | (person, book) <- dBase, person == thisPerson]
 
borrow :: Database -> Book -> Person -> Database
borrow dBase book thisPerson = [(person, bk) | (person, bk) <- dBase, book /= bk]

return' :: Database -> (Person,Book) -> Database
return' dBase (thisPerson, thisBook) = dBase ++ [(thisPerson, thisBook)]

-- Ejercicio 12
data Tree a = Leaf a | Branch (Tree a) (Tree a) deriving Show

symmetric :: Tree a -> Tree a
symmetric (Leaf x) = Leaf x
symmetric (Branch a b) = Branch (symmetric b) (symmetric a)

-- Ejercicio 13
listToTree :: [a] -> Tree a
listToTree [x] = Leaf x
listToTree (x:xs) = Branch (Leaf x) (listToTree xs) 

treeToList :: Tree a -> [a]
treeToList (Leaf x) = [x]
treeToList (Branch x y) = (treeToList y) ++ (treeToList x)

-- Ejercicio 14
data BinTreeInt = Void | Node Int BinTreeInt BinTreeInt deriving Show

insTree :: Int -> BinTreeInt -> BinTreeInt
insTree x Void = (Node x) Void Void
insTree x (Node a b c) = if x <= a then (Node a) (insTree x b) c else
						 (Node a) b (insTree x c)
						 
 
-- Ejercicio 15
creaTree :: [Int] -> BinTreeInt
creaTree [] = Void
creaTree [x] = insTree x Void
creaTree (x:xs) = creaTree xs (insTree x)

-- Ejercicio 16
--treeElem :: Int -> BinTreeInt -> Bool




























{-


data BinTreeInt = Void | Node Int BinTreeInt BinTreeInt deriving Show

--let treeB1 = Void
--let treeB2 = (Node 5) Void Void
--let treeB3 = (Node 5) 
--             ((Node 3)(Node 1 Void Void)(Node 4 Void Void)) 
--             ((Node 6) Void (Node 8 Void Void))

insTree :: Int -> BinTreeInt -> BinTreeInt
insTree x Void = (Node x) Void Void
insTree x (Node y a b) = if x <= y then (Node y) (insTree x a) b
                                    else (Node y) a (insTree x b)


-- example: 
-- insTree 6 (Node 3 (Node 2 Void Void) (Node 7 (Node 4 Void Void) (Node 9 Void Void)))
-- ==> Node 3 (Node 2 Void Void) (Node 7 (Node 4 Void (Node 6 Void Void)) (Node 9 Void Void))


-- *** Exercise 19 - Practice 4 *** 

creaTree :: [Int] -> BinTreeInt
creaTree [x] = insTree x Void
creaTree (x:xs) = insTree x (creaTree xs) 

-- example: 
-- creaTree [3,2,4,1]
-- ==> Node 1 Void (Node 4 (Node 2 Void (Node 3 Void Void)) Void)
 

-- *** Exercise 20 - Practice 4 *** 

treeElem :: Int -> BinTreeInt -> Bool
treeElem x Void = False
treeElem x (Node y a b) = if x == y then True
                                    else treeElem x a || treeElem x b

-- examples: 
-- treeElem 9 (Node 3 (Node 2 Void Void) (Node 7 (Node 4 Void Void) (Node 9 Void Void)))
-- ==> True
-- treeElem 6 (Node 3 (Node 2 Void Void) (Node 7 (Node 4 Void Void) (Node 9 Void Void)))
-- ==> False


-- *** Exercise 21 - Practice 4 *** 

dupElem :: BinTreeInt -> BinTreeInt
dupElem Void = Void
dupElem (Node y a b) = ((Node (y*2)) (dupElem a) (dupElem b))

-- examples: 
-- dupElem treeB1 ==> Void
-- dupElem treeB2 ==> Node 10 Void Void
-- dupElem treeB3 ==> Node 10
--                    (Node 6 (Node 2 Void Void) (Node 8 Void Void))
--                    (Node 12 Void (Node 16 Void Void))


-- *** Exercise 22 - Practice 4 *** 

data Tree' a = Branch' a (Tree' a) (Tree' a) | Void' deriving Show

countProperty :: (a -> Bool) -> (Tree' a) -> Int
countProperty x Void' = 0
countProperty f (Branch' x a b)
                              |f x = 1 + countProperty f a + countProperty f b
                              |otherwise = countProperty f a + countProperty f b

-- examples: 
-- countProperty (>9) (Branch' 5 (Branch' 12 Void' Void') Void') ==> 1
-- countProperty (>0) (Branch' 5 (Branch' 12 Void' Void') Void') ==> 2
-}
