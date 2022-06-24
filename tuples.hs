-- Tuples.hs

module Tuples where

import Data.List
import System.IO

randTuple = (1, "Random Tuple")

bobSmith = ("Bob Smith", 52)

bobName = fst bobSmith

bobAge = snd bobSmith

names = ["Bob", "Mary", "Tom"]

addresses = ["123 Main", "234 North", "532 West"]

namesNAddresses = zip names addresses

-- let (x, y) = (1, 2) in x

-- Exercises
-- (1) Create a function hasPath that determines if a path from one node to another exists within a directed graph
-- [ (1,2), (2,3), (3,2), (4,3), (4,5)]
hasPath :: [(Int, Int)] -> Int -> Int -> Bool
hasPath [] _ _ = False
hasPath (x,y):xs a b = 

