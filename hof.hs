-- hof.hs

module HOF where

import Data.List
import System.IO

times4 :: Int -> Int
times4 x = x * 4

listTimes4 = map times4 [1,2,3,4,5]

multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x:xs) = times4 x : multBy4 xs

-- more recursion ❤️
areStringsEq :: [Char] -> [Char] -> Bool
areStringsEq [] [] = True
areStringsEq (x:xs) (y:ys) = x == y && areStringsEq xs ys
areStringsEq _ _ = False -- everything else false 

-- receive function
doMult :: (Int -> Int) -> Int
doMult func = func 3

num3Times4 = doMult times4

-- return function
getAddFunc :: Int -> (Int-> Int)
getAddFunc x y = x + y
add3 = getAddFunc 3
fourPluse3 = add3 4

threePlusList = map add3 [1,2,3,4,5]
