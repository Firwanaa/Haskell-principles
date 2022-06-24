-- recursion.hs
module Recursion where

import Data.List
import System.IO

-- factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n -1)

-- n = 3
-- 3 * factorial(2) == 6
-- 2 * factorial(1) == 2
-- 1 * factorial(0) == 1
-- 1

productFact n = product [1 .. n]

-- using guards
isOdd :: Int -> Bool
isOdd n
  | n `mod` 2 == 0 = False -- if n is even return false
  | otherwise = True

-- isOdd2 :: Int -> Bool
-- isOdd2 n
--  | n `mod` 2 /= 0 = True -- if n is not even return false
--  | otherwise = False

isEven n = n `mod` 2 == 0

drop' :: Int -> [a] -> [a]
drop' 0 xs = xs
drop' _ [] = []
drop' n (_ : xs) = drop' (n -1) xs

-- drop' 3 [1,2,3,4,5]
-- drop' (3-1) [2,3,4,5]  = drop' 2 [2,3,4,5]
-- drop' (1) [3,4,5]
-- drop' (0) [4,5]
-- [4,5]

-- more
fac n =
  if n <= 1
    then 1
    else n * fac (n -1)

fac' n
  | n <= 1 = 1
  | otherwise = n * fac (n -1)

-- Accumulators
fac4 n = aux n 1
  where
    aux n acc
      | n <= 1 = acc
      | otherwise = aux (n -1) (n * acc)
