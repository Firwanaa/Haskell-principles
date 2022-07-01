-- lists.hs

module Lists where

import Data.List
import Data.Map.Internal.Debug (ordered)
import Debug.Trace
import Distribution.Simple.Utils (xargs)
import System.IO

primesNumbers = [2, 5, 7, 11]

morePrimes = primesNumbers ++ [13, 17, 19, 23, 29]

favNumes = 2 : 7 : 21 : 66 : []

multiList = [[3, 5, 7], [11, 13, 17]]

morePrimes2 = 2 : morePrimes

listTimes2 = [x * 2 | x <- [1 .. 10]]

listTimes3 = [x * 3 | x <- [1 .. 50], x * 3 <= 50]

as = take 10 (repeat 'a')

lettersList = ['A', 'B' .. 'Z']

evensList = [2, 4 .. 100]

-- divisBy9N13 = [x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]
divisBy9N13 = [x | x <- [1 .. 500], x `mod` 13 == 0 && x `mod` 9 == 0]

sortedList = sort [7, 9, 4, 9, 23, 55, 1, 0, 12, 4, 13, 33]

sumOfLists = zipWith (+) [1, 2, 3, 4] [5, 6, 7, 8]

listBiggerThan5 = filter (> 5) morePrimes

-- [2,4..] -- infinit list syntax,
-- since Haskell is lazy it will generate up 20 as required and stop
evenUpTo20 = takeWhile (<= 20) [2, 4 ..]

-- foldl means fold from left side
multOfList = foldl (*) 1 [2, 3, 4, 5]

pow3List = [3 ^ n | n <- [1 .. 10]]

multTable = [[x * y | y <- [1 .. 10]] | x <- [1 .. 10]]

getListItems :: [Int] -> String
getListItems ([]) = "Your list starts is Empty "
getListItems (x : []) = "Your list starts with " ++ show x
getListItems (x : y : []) = "Your list contains " ++ show x ++ " and " ++ show y
getListItems (x : xs) = "The 1st itemis " ++ show x ++ " and the rest is " ++ show xs

getFirstItem :: String -> String
getFirstItem [] = "Empty String"
getFirstItem all@(x : xs) = "The first letter in " ++ all ++ " is " ++ [x]

evens :: [Int] -> [Int]
evens [] = []
evens xs = [a | a <- xs, mod a 2 == 0]

evens' :: [Int] -> [Int]
evens' [] = []
evens' (x : xs)
  | x `mod` 2 == 0 = x : evens' xs
  | otherwise = evens' xs

-- List Exercises
-- (1) create a function elem that returns True if an element is in a given list and return False otherwise

elem' :: (Eq a) => a -> [a] -> Bool
elem' _ [] = False
elem' y (x : xs)
  | x == y = True
  | otherwise = elem' y xs

elem1 :: (Eq a) => a -> [a] -> Bool
elem1 _ [] = False
elem1 y (x : xs) = (y == x) || (elem1 y xs)

-- (2) Create a function nub that removes all duplicates from a given list
nub' :: (Eq a) => [a] -> [a]
nub' [] = []
nub' (x : xs) = x : [a | a <- nub' xs, a /= x]

nub1 :: (Eq a) => [a] -> [a]
nub1 [] = []
nub1 (x : xs)
  | x `elem` xs = nub1 xs
  | otherwise = x : nub1 xs

-- (3) Create a function isAsc that returns True if the list given to it is a lis of ascending order
isAsc :: [Int] -> Bool
isAsc [] = True
isAsc [a] = True
isAsc (x : xs) = x <= head xs && isAsc xs

pairs :: [a] -> [(a, a)]
pairs xs = zip xs (tail xs)

sorted xs = and [x <= y | (x, y) <- pairs xs]

positions :: Ord a => a -> [a] -> [Int]
positions x xs = [i | (x', i) <- zip xs [0 .. n], x' == x] where n = length xs - 1
