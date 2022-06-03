-- CeaserCipher.hs 
-- Programming in Haskell by Graham Hutton
-- Ch5
-- lower-case letters only -- for now
module CeaserCipher where
import Data.List
import Data.Char
import System.IO

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
decode n xs = encode (-n) xs