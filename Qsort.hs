--Haskell Programming By Prof Graham Hutton
-- Qsort.hs
module Qsort where
import Data.List
import System.IO
import Data.Text.Internal.Fusion.Size (larger)

qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
                where
                        smaller = [a | a <- xs, a <= x]
                        larger  = [b | b <- xs, b > x]

list1 = [2,3,4,1,0 ,5]
list2 = [2,2,3,1,1]
sortedList1 = qsort list1
sortedList2 = qsort list2