-- typeInference1.hs --
module TypeInference where
import Data.List
import System.IO

f :: Num a =>  a -> a -> a
f x y = x + y + 3

-- typeInference2.hs

f2 x y = x + y + 3