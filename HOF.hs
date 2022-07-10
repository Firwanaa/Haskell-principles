-- HOF.hs
-- Programming in Haskell - Ch 7
module HOF where

import Data.List
import GhcPlugins (PluginWithArgs (paArguments))
import System.IO

twice :: (a -> a) -> a -> a
twice f x = f (f x)

map' :: (a -> b) -> [a] -> [b]
map' f xs = [f x | x <- xs]

-- map with recursion
recmap :: (a -> b) -> [a] -> [b]
recmap f [] = []
recmap f (x : xs) = f x : map f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' p xs = [x | x <- xs, p x]

-- filter with recursion
recfilter :: (a -> Bool) -> [a] -> [a]
recfilter p [] = []
recfilter p (x : xs)
  | p x = x : filter p xs
  | otherwise = filter p xs

sumsqreven :: [Int] -> Int
sumsqreven ns = sum (map' (^ 2) (filter' even ns))

foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f v [] = v
foldr' f v (x : xs) = f x (foldr' f v xs)

main :: IO ()
main = do
  --  putStrLn "Twice *2"
  --  print $ twice (*2) 3

  --  putStrLn "Twice +2"
  --  print $ twice (+2) 3

  --  print "Twice reverse \n"
  --  print $ twice reverse [1,2,3]
  print "Map' (+1)\n"
  print $ map' (+ 1) [1, 2, 3, 4]

-- ifEvenInc n = if even n
--                then n + 1
--                else n

-- ifEvenDouble n = if even n
--                  then n * 2
--                  else n

-- ifEvenSquare n = if even n
--                  then n ^ 2
--                  else n

ifEven myFunction x =
  if even x
    then myFunction x
    else x

-- now we can abstract these funcitons
inc n = n + 1

double n = n * 2

square n = n ^ 2

ifEvenInc n = ifEven inc n

ifEvenDouble n = ifEven double n

ifEvenSquare n = ifEven square n

-- Funtions are always evaluated before operators "Higher precedence"
-- > 1 + 2 * 3
--   1 + 6
-- > 7
-- BUT
-- > inc 2 * 3
--   3 * 3
-- > 9
-- same goes for multi - arguments functions
-- > add 1 2 * 3
-- > 9
names = [("Ian", "Curtis"), ("Bernard", "Sumner"), ("Peter", "Hook"), ("Stephen", "Morris")]

compareLastNames name1 name2 =
  if lastName1 > lastName2
    then GT
    else
      if lastName1 < lastName2
        then LT
        else EQ
  where
    lastName1 = snd name1
    lastName2 = snd name2
-- impor Data.List
-- > sort names
-- > [("Bernard","Sumner"),("Ian","Curtis"),("Peter","Hook"),("Stephen","Morris")]
-- will sort based on first value of the tuple "First name"
-- now we can sortBy sencond value in the tuple
-- > sortBy compareLastNames names
-- > [("Ian","Curtis"),("Peter","Hook"),("Stephen","Morris"),("Bernard","Sumner")]

-- incase of simlar lastname compare with first name

compareLastNames name1 name2 =
  if lastName1 > lastName2
    then GT
    else
      if lastName1 < lastName2
        then LT
        else
          if firstName1 > firstName2
            then GT
            else
              if firstName1 < firstName2
                then LT
                else EQ
  where
    lastName1 = snd name1
    lastName2 = snd name2
    firstName1 = fst name1
    firstName2 = fst name2
