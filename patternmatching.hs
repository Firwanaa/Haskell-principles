--patternmatching.hs --
-- Programming in Haskell - Ch 4 questions
module PatternMatching where
import Data.List
import System.IO

-- function return third elemet in list
third xs = head (tail (tail xs))

third2 xs = xs !! 2
third3 (_:_:x:_) = x


safetail xs = if null xs then [] else tail xs

safetail2 :: [a] -> [a]
safetail2 xs | null xs = []
	     | otherwise = tail xs