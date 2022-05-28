-- if.hs
module If where
import Data.List 
import System.IO

-- < > <= >= == /= 
-- /= is not equalt
-- && || not

doubleEvenNumber y = 
 if(y `mod` 2/=0)
  then y
  else y * 2

-- case statments 
getClass :: Int -> String
getClass n = case n of
 5 -> "Go to kindergarten"
 6 -> "Go to Elementary school"
 12 -> "Go to Middle school"
 _ -> "Have fun"