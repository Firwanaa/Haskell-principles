-- guards.hs
module Guards where
import Data.List
import System.IO

-- using guards 
isOdd :: Int -> Bool
isOdd n
 | n `mod` 2 == 0 = False -- if n is even return false
 | otherwise = True

-- isOdd2 :: Int -> Bool
-- isOdd2 n
--  | n `mod` 2 /= 0 = True -- if n is not even return false
--  | otherwise = False

-- without guards
isEven n = n `mod` 2 == 0

whatGrade :: Int -> String
whatGrade age
 | (age < 5) = "Change diapers"
 | (age >= 5) && (age <= 6) = "Kindergarten"
 | (age >= 6) && (age <= 10) = "Elementary school"
 | (age >= 10) && (age <= 14) = "Middle Scool"
 | (age >= 14) && (age <= 17) = "High School"
 | otherwise = "Go to college"


batAvgRating :: Double -> Double -> String
batAvgRating hits atBats
 | avg <= 0.200 = "Terrile Batting"
 | avg <= 0.250 = "Average Player"
 | avg <= 0.280 = "Player doing pretty good"
 | otherwise = "You are superman"
 where avg = hits/atBats
