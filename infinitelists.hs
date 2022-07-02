-- inifinit list of ones
ones = 1 : ones

list1 = take 5 (map (* 2) ones)

-- natural numbers
nat = asc 1
  where
    asc n = n : (asc $ n + 1)

-- evens
evens = map (* 2) nat

evens' = filter (\x -> mod x 2 == 0) nat

-- odds
odds = filter (\x -> mod x 2 /= 0) nat

odds' = filter (\x -> mod x 2 == 1) nat

-- Fibonacci Sequence

-- f :: (Eq a, Num a, Num p) => a -> p
-- f 0 = 0
-- f 1 = 1
-- f n = (f $ n-1) + (f $ n-2)
-- bad
-- fibs = map f nat

fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

-- iteration (1)
-- fibs = 0 : 1 : zipWith ...
-- tails fibs = 1 : zipWith
-- zipWith (+) (0:...) (1:...) = 0+1 : ...
-- now our fibs list is 0 : 1 : 1 ...

-- iteration (2)
-- fibs = 1 : 1 : zipWith ...
-- tail fibs = 1 : zipWith
-- zipWith (+) (1:...) (1:..) = 1+1 : ...
-- now ower fibs list is 0 : 1 : 1 : 2

-- iteration (3)
-- fibs = 1 : 2 : zipWith ...
-- tail fibs = 2 : zipWith
-- zipWith (+) (1:...) (2:..) = 1+2 : ...
-- now ower fibs list is 0 : 1 : 1 : 2 : 3

-- iteration (4)
-- fibs = 2 : 3 : zipWith ...
-- tail fibs = 3 : zipWith
-- zipWith (+) (2:...) (3:..) = 2+3 : ...
-- now ower fibs list is 0 : 1 : 1 : 2 : 5

-- iteration (5)
-- fibs = 3 : 5 : zipWith ...
-- tail fibs = 5 : zipWith
-- zipWith (+) (3:...) (5:..) = 3+5 : ...
-- now ower fibs list is 0 : 1 : 1 : 2 : 5 : 8

-- The question is "Does the Fibonacci series start with 0 or with 1?" .. 🤔🤔🤔🤔🤔
fib = 1 : 1 : [a + b | (a, b) <- zip fib (tail fib)]

-- Exercises

-- Exercise #1
data Tree a = Leaf | Node (Tree a) a (Tree a) deriving (Show)

-- infint tree
inv_tup_tree = aux (0, 0) where aux (l, r) = Node (aux $ (l + 1, r)) (l, r) (aux $ (l, r + 1))

cut :: Integer -> Tree a -> Tree a
cut 0 _ = Leaf
cut n Leaf = Leaf
cut n (Node l v r) = Node (cut (n -1) l) v (cut (n -1) r)
