-- Functors.hs 
-- Programming in Haskell - Ch 12
-- Monads and more
module Functors where

inc = map (+1)
sqr = map(^2)
list = [1..]

list2 = inc list
list3 = sqr list

data Tree a = Leaf a | Node (Tree a) (Tree a) deriving Show

instance Functor Tree where
        -- fmap :: (a -> b) -> Tree a -> Tree b 
        fmap g (Leaf x) = Leaf (g x)
        fmap g (Node l r) = Node (fmap g l) (fmap g r)


-- instance Functor IO where
--         -- fmap :: (a -> b) -> IO a -> IO b
--         fmap g mx = do {x <- mx; return (g x)}

inc1 :: Functor f => f Int -> f Int 
inc1 = fmap (+1)


{-- Functor laws
 1. Law of Identity
        fmap id = id 
        Eg.
        > fmap id Just 3 = 
        > Just 3

2. Law of composition
        fmap (g . h) = fmap g . fmap h 
        -- same as a -> b then b -> c
        Eg.
        > fmap (not . even) [1,2]
        > [True, False]
        > fmap (not . not . even) [1,2] -- 😬
        > [False, True]
--}