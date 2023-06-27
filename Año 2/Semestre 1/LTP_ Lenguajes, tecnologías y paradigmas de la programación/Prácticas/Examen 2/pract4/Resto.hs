module Resto where
  remainder :: Int -> Int -> Int
  remainder x y = if x >= y then remainder (x - y) y else x