-- lists.hs

module Lists where

import Data.List
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

sumOfLists = zipWith (+) [1,2,3,4] [5,6,7,8]

listBiggerThan5 = filter (>5) morePrimes

-- [2,4..] -- infinit list syntax, 
-- since Haskell is lazy it will generate up 20 as required and stop
evenUpTo20 = takeWhile (<=20) [2,4..]

-- foldl means fold from left side
multOfList = foldl (*) 1 [2,3,4,5]

pow3List = [3^n | n <- [1..10]]

multTable = [[x*y | y <- [1..10]] | x<- [1..10]]

getListItems :: [Int] -> String
getListItems ([]) = "Your list starts is Empty "
getListItems (x:[]) = "Your list starts with " ++ show x
getListItems(x:y:[]) = "Your list contains " ++ show x++ " and " ++ show y
getListItems(x:xs) = "The 1st itemis "++show x++ " and the rest is "++ show xs


getFirstItem :: String -> String
getFirstItem [] = "Empty String"
getFirstItem all@(x:xs) ="The first letter in " ++ all ++ " is " ++ [x]