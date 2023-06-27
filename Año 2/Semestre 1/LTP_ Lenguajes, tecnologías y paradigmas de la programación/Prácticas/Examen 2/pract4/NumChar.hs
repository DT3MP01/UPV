module NumChar where
  import Data.Char
  
  numCbetw2 :: Char -> Char -> Int
  numCbetw2 x y =
                 if (ord x) == (ord y) then 0 else
		 abs((ord y) - (ord x)) - 1