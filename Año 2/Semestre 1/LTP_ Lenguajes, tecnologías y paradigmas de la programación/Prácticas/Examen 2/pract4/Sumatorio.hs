module Sumatorio where
  addRange :: Int -> Int -> Int
  addRange i n = if i == n then i else
	         if i > n then n + addRange (n + 1) i else
		 i + addRange (i + 1) n