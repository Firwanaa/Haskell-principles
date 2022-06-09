-- Abstractmachine.hs
-- Programming in Haskell - Ch 8
--- Abstract Machine
module Abstractmachine where

import Data.List
import System.IO
import Typesandclasses

-- Prof Hutton's YouTube Channel example
data Expr = Val Int | Add Expr Expr| Mul Expr Expr deriving Show 
                        
size :: Expr -> Int
size (Val n) = 1
size (Add x y) = size x + size y
size (Mul x y) = size x + size y

eval :: Expr -> Int
eval (Val n) = n
eval (Add x y) = eval x + eval y
eval (Mul x y) = eval x * eval y

-- eval' = folde id (+) (*)

-- Exercise
-- 1 - Using recursion and function add, define a function that
--     multiplies two natural numbers.
mult :: Nat -> Nat -> Nat
mult Zero m = Zero
mult (Succ n) m = add (mult n m) m

-- test on ghci
-- res = mult (Succ (Succ (Succ Zero))) (Succ (Succ Zero))
-- print $ nat2int res
-- 6

-- 2 - Define a suitable function folde for expressions and give 
--     a few examples of its use.

-- 3 - Define typ "Tree a" of binary trees built from "Leaf"
--     values of type a using a Node constructor that takes two binary trees
--      as parameters.
data Tree' a = Leaf' a 
             | Node' (Tree' a) (Tree' a) 

-- Book Example
-- data Expr = Val Int | Add Expr Expr  
-- value :: Expr -> Int
-- value (Val n) = n
-- value (Add x y) = value x + value y

-- type Cont = [Op]
-- data Op = Eval Expr | ADD Int

-- eval :: Expr -> Cont -> Int
-- eval (Val n) c = exec c n
-- eval (Add x y) c = eval x (EVAL y : c)

-- exec :: Cont -> Int -> Int
-- exec [] n = n
-- exec (EVAL y : c) n eval y (ADD n : c)
-- exec (ADD n : c) m = exec c (n+m)

-- value :: Expr -> Int
-- value e = eval e []