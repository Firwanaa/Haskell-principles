-- Find.hs
module Find where

find k t = [v | (k',v) <- t, k == k']

testList = [('a', 1), ('b', 2), ('c', 3), ('d', 4)]