-- TypeDeclarations.hs
module TypeDeclarations where

import Data.List
import System.IO

addMe :: Int -> Int -> Int

-- functionName param1 param2 = operations (returned value)
addMe x y = x + y

sumMe x y = x + y


addTuples :: (Int, Int) -> (Int, Int) -> (Int,Int)
addTuples (x1, y1) (x2, y2) = (x1+x2, y1+y2)
sumTuples (x1, y1) (x2, y2) = (x1+x2, y1+y2)

whatAge :: Int -> String
whatAge 16 = "You can drive"
whatAge 18 = "You can vote"
whatAge 21 = "You can marry"
whatAge 24 = "You can be predident"
whatAge _ = "Not sure"