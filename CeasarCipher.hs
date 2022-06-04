-- CeaserCipher.hs 
-- Programming in Haskell by Graham Hutton
-- Ch5
-- lower-case letters only -- for now
module CeaserCipher where
import Data.List
import Data.Char
import System.IO
import Find
import Zip
import Distribution.Compat.CharParsing (lower)

-- Char to Int using ord from "Data.Char"
-- E.g. ord 'a' is 97 
let2int :: Char -> Int
let2int c = ord c - ord 'a'

-- Ord to Char
-- E.g. chr 97 is 'a'  
-- 'a' to 'z' will be 0 - 25
int2let:: Int -> Char
int2let n = chr (ord 'a' + n)

shift :: Int -> Char -> Char
shift n c | isLower c = int2let ((let2int c + n) `mod` 26) -- mod 26 to wrap around
          | otherwise = c
encode :: Int -> String -> String
encode n xs = [shift n x |  x <- xs]
decode :: Int -> String -> String
decode n = encode (-n)
-- decode n xs = encode (-n) xs


-- Frequency tables to Crack Ceaser Cipher
table :: [Float]
table = [8.1, 1.5, 2.8, 4.2, 12.7, 2.2, 2.0, 6.1, 7.0,0.2, 0.8, 4.0, 2.4, 6.7, 7.5, 1.9, 0.1, 6.0,6.3, 9.0, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1]

-- percentage of one integer with respect to another 
-- "fromIntegral" converts an Integer into a floating point number
percent :: Int -> Int -> Float
percent n m = (fromIntegral n / fromIntegral m) * 100


-- function returns a frequency table of any given string with
freqs :: String -> [Float]
freqs xs = [percent (count x xs) n | x <- ['a'..'z']]
 where n = lowers xs

-- chi-square
-- os: observed frequencies
-- es: expected frequencies 
chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum [((o-e)^2)/e | (o,e) <- zip os es]

rotate :: Int -> [a] -> [a]
rotate n xs = drop n xs ++ take n xs

-- table2 = freqs "kdvnhoo lv ixq"

crack :: String -> String
crack xs = encode (-factor) xs
   where
           factor = head (positions (minimum chitab) chitab)
           chitab = [chisqr (rotate n table') table | n<- [0..25]]
           table' = freqs xs