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

(||) :: Bool -> Bool
True || _ = True
a || True = True

False || False = False
_ || _ = True

-- 5. Without using any other library functions or operators, show how the meaning
-- of the following pattern matching definition for logical conjunction && can be
-- formalised using conditional expressions:
-- True && True = True
-- _ && _ = False
-- Hint: use two nested conditional expressions.

(&&) :: Bool -> Bool
(&&) x y = if x then
               if y then
                   True
               else
                   False
           else
               False

-- 7. Show how the meaning of the following curried function definition can be
-- formalised in terms of lambda expressions:
-- mult :: Int -> Int -> Int -> Int
-- mult x y z = x*y*z

mult x y z = (\x -> (\y -> (\z -> x * y * z)))
