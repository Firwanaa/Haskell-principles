-- folding.hs

import Data.List
import Distribution.Simple.Program.HcPkg (list)
import System.Posix (BaudRate (B200))

-- Sample  foldr (\x y -> (x+y)/2) 54 [12,4,10,16]
-- let's save our function for simplicity  (f = (\x y -> (x+y)/2)
-- so our sample question will be foldr f 54 [12,4,10,6]
-- (f 12 (f 4 (f 10 (f 6 54)))
-- left              right

-- now we start our evaluation from the right side
-- (First step)
-- f 16 54 = (\16 54 -> (6 + 54)/2)
--         = ((60)/2)
--         = 30
-- so will end up with this
-- (f 12 (f 4 (f 10 (30)))

-- (Second step)
-- (f 12 (f 4 (f 10 (30)))
-- left        right
-- f 10 30 = (\10 30 -> (10+30)/2) = 20
-- so will end up with this
-- (f 12 (f 4 (20 (30)))

-- (Third step)
-- (f 12 (f 4 (20))
-- left   right
-- f 4 20 = (\4 20 -> (4+20)/2) = 12

-- (Last step)
-- (f 12 (12))
-- right -- since it's last step
-- f 12 12 = 12
-- Answer is 12

-- If we want to fold left (foldl)
-- f (f 54 12) [4,10,6]
-- f (f 33 4) [10,6]
-- f (f 18.5 10) [6]
-- f 14.25 6
-- 10.125
-- left              right

-- Exercises
-- (1) Create a function (rev) that reverse a list

rev :: [a] -> [a]
rev xs = foldr (\y ys -> ys ++ [y]) [] xs

rev' :: [a] -> [a]
rev' = foldl (\xs x -> x : xs) []

-- (2) Create a funciton prefixes that returns all the prefixes of a given list

prefixes :: [a] -> [[a]]
prefixes = foldr (\x acc -> [x] : (map ((:) x) acc)) []
