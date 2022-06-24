-- hof.hs

module HOF where

import Data.List
import Distribution.Simple (KnownExtension (FunctionalDependencies))
import System.IO

times4 :: Int -> Int
times4 x = x * 4

listTimes4 = map times4 [1, 2, 3, 4, 5]

multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x : xs) = times4 x : multBy4 xs

-- more recursion ❤️
areStringsEq :: [Char] -> [Char] -> Bool
areStringsEq [] [] = True
areStringsEq (x : xs) (y : ys) = x == y && areStringsEq xs ys
areStringsEq _ _ = False -- everything else false

-- receive function
doMult :: (Int -> Int) -> Int
doMult func = func 3

num3Times4 = doMult times4

-- return function
getAddFunc :: Int -> (Int -> Int)
getAddFunc x y = x + y

add3 = getAddFunc 3

fourPluse3 = add3 4

threePlusList = map add3 [1, 2, 3, 4, 5]

-- more
app :: (a -> b) -> a -> b
app f x = f x

-- add1 :: Int -> Int
-- add1 x = x + 1

-- app add1 1
-- Anonymous Functions
-- (\<args> -> <expr>)
add1 = (\x -> x + 1)

-- (\x y z -> x + y + z)

-- app (\x -> x + 1) 1

-- map (\x -> x+1) [1,2,3,4]

-- map (\(x,y) -> x+y) [(1,2), (2,3), (3,4)]
