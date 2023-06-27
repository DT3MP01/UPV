module SumaFactoriales where
  fact :: Int -> Int
  fact 0 = 1
  fact n = n * fact (n - 1)

  sumFacts :: Int -> Int
  sumFacts n = if n == 0 then 0 else
               fact n + sumFacts (n - 1)

  