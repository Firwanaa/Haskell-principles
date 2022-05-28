-- recursion.hs
module Recursion where

import Data.List
import System.IO

-- factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

-- n = 3
-- 3 * factorial(2) == 6
-- 2 * factorial(1) == 2
-- 1 * factorial(0) == 1
-- 1

productFact n = product [1..n]

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