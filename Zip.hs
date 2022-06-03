-- Zip.hs
-- List Comprehensions 
module Zip where

import Data.List

-- pair element with adjacent

pairs xs = zip xs (tail xs)

sorted xs = and [x <= y | (x,y) <- pairs xs]

positions x xs = [i | (x',i) <- zip xs [0..], x == x']


-- Strings 

lowers xs = length [x | x <- xs, x >= 'a' && x <= 'z']

-- coun occurrence of letter 
count x xs = length [x' | x' <- xs, x == x']
