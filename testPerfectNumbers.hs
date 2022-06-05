module Main where
import Data.List
import System.IO


factors :: Integral a=> a -> [a]
factors n = [x | x <- [1 .. n - 1], n `mod` x == 0]

perfects :: Integral a=> a -> [a]
perfects n = [x | x <- [1..n], sum (factors x) == x]

main :: IO ()
main = do
 putStrLn "Hello From List Comprehensions"
 print $ perfects 10000
