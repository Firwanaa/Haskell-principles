-- Typesandclasses.hs
-- Programming in Haskell - Ch 8
--- Declaring Types and Classes
---- Recursive Types
module Typesandclasses where

import Data.List
import System.IO

-- Example 1 - Nat
data Nat = Zero | Succ Nat deriving (Eq, Show)

nat2int :: Nat -> Int
nat2int Zero = 0
nat2int (Succ n) = 1 + nat2int n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n - 1))

add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ m) n = Succ (add m n)

-- Example 2 - List
data List a = Nil | Cons a (List a) deriving (Eq, Show)

len :: List a -> Int
len Nil = 0
len (Cons _ xs) = 1 + len xs 

-- Example 3 - Tree
data Tree a = Leaf a | Node (Tree a) a (Tree a) deriving (Eq, Show)

t:: Tree Int
t = Node (Node (Leaf 1) 3 (Leaf 4)) 5
         (Node (Leaf 6) 7 (Leaf 9))

occurs :: Eq a => a -> Tree a -> Bool
occurs x (Leaf y) = x == y
occurs x (Node l y r) = x == y || occurs x l || occurs x r

flatten :: Tree a -> [a]
flatten (Leaf a) = [a]
flatten (Node l x r) = flatten l ++ [x] ++ flatten r

-- if resulting list is sorted we call it search tree
-- occurs function for search trees 

occurs' :: Ord a => a -> Tree a -> Bool
occurs' x (Leaf y) = x == y
occurs' x (Node l y r) | x == y = True
                       | x < y = occurs x l
                       | otherwise = occurs x r

-- different types of trees 
data Tree1 a = Leaf1 a | Node1 (Tree1 a) (Tree1 a) -- data in leaves only
data Tree2 a = Leaf2 | Node2 (Tree2 a) a (Tree2 a) -- data in Nodes only
data Tree3 a b = Leaf3 a | Node3 (Tree3 a b) b (Tree3 a b) -- different data in both leaves and nodes
data Tree4 a = Node4 a [Tree4 a] -- List of subtrees


