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

