import Queue

toList :: (Queue a) -> [a]
toList x
        | isEmpty x = []
        | otherwise = (first x) : (toList (dequeue x))
		
fromList :: [a] -> (Queue a)
fromList x
		| x == [] = empty
		| otherwise = head x : enqueue x a
			