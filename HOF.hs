-- HOF.hs
-- Programming in Haskell - Ch 7
module HOF where
import Data.List
import System.IO


twice :: (a -> a) -> a -> a 
twice f x = f (f x)

map' :: (a -> b) -> [a] -> [b]
map' f xs = [f x | x <- xs]

-- map with recursion
recmap :: (a -> b) -> [a] -> [b]
recmap f [] = []
recmap f (x:xs) = f x : map f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' p xs = [x | x <- xs, p x]

-- filter with recursion
recfilter :: (a -> Bool) -> [a] -> [a]
recfilter p [] = []
recfilter p (x:xs)  | p x = x : filter p xs
                    | otherwise = filter p xs

sumsqreven :: [Int] -> Int
sumsqreven ns = sum (map' (^2) (filter' even ns))


foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f v [] = v
foldr' f v (x:xs) = f x (foldr' f v xs)

main :: IO ()
main =do
--  putStrLn "Twice *2"
--  print $ twice (*2) 3
 
--  putStrLn "Twice +2"
--  print $ twice (+2) 3

--  print "Twice reverse \n"
--  print $ twice reverse [1,2,3]
 print "Map' (+1)\n"
 print $ map' (+1) [1,2,3,4]