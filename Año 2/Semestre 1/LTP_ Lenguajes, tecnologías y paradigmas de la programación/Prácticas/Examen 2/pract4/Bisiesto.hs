module Bisiesto where
  lapyear :: Int -> Bool
  lapyear x = (mod x 4) == 0 && ((mod x 100) /= 0) || (mod x 400) == 0)