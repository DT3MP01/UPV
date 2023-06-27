module DiasMes where
  daysAMonth :: Int -> Int -> Int
  daysAMonth m y
                | m == 2 && leapyear y = 29
		| m == 2 = 28
		| m == 4 || m == 6 || m == 9 || m == 11 = 30
		| otherwise = 31
