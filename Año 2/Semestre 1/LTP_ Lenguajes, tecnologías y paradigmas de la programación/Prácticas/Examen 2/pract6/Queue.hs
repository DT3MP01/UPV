module Queue (Queue, empty, enqueue, dequeue, first, isEmpty, size) where
    data Queue a = EmptyQueue | Item a (Queue a)

    empty = EmptyQueue
    enqueue x EmptyQueue = Item x EmptyQueue
    enqueue x (Item a q) = Item a (enqueue x q)
    dequeue (Item _ q) = q
    first (Item a _) = a
    isEmpty EmptyQueue = True
    isEmpty _ = False
    size EmptyQueue = 0
    size (Item _ q) = 1 + size q
    
    instance Show a => Show (Queue a) where
     show EmptyQueue = " <- "
     show (Item x y) = " <- " ++ (show x) ++ (show y)

    instance (Eq a) => Eq (Queue a) where
        EmptyQueue == EmptyQueue = True
        Item x EmptyQueue == Item y EmptyQueue = x == y
        Item x y == Item a b = x == a && y == b
        _ == _ = False
