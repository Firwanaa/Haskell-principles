-- BST.hs -- Binary String Transmitter
-- Programming in Haskell - Ch 7
module BST where
import Data.List
import System.IO

import Data.Char

type Bit = Int
bin2int :: [Bit] -> Int
bin2int bits = sum [ w*b | (w,b) <- zip weights bits]
                   where weights = iterate (*2) 1

bin2int' :: [Bit] -> Int
bin2int' =foldr (\x y -> x + 2*y) 0 

int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)

addparity :: [Bit] -> [Bit]
addparity xs | odd (sum xs) = xs ++ [1]
             | otherwise = xs ++ [0]

biencode :: String -> [Bit]
biencode = concat . map (addparity . make8 . int2bin . ord)

paritychecker :: [Bit] -> Bool
paritychecker xs | length xs == 9 && ((sum (init xs)) `mod` 2) == (lst xs) = True
                 | otherwise = error "Transmission error!"

discardparitybit :: [[Bit]] -> [[Bit]]
discardparitybit xs = map (take 8) xs


bidecode :: [Bit] -> String
bidecode xs = map (chr . bin2int) .discardparitybit $ filter paritychecker (chop9 xs)

-- Transmission
encode :: String -> [Bit]
encode = concat . map (make8 . int2bin . ord)

chop8 :: [Bit] -> [[Bit]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits)

chop9 :: [Bit] -> [[Bit]]
chop9 [] = []
chop9 bits = take 9 bits : chop9 (drop 9 bits)

decode :: [Bit] -> String
decode = map (chr . bin2int) . chop8

transmit :: String -> String 
transmit = decode . channel . encode

channel :: [Bit] -> [Bit]
channel = id

