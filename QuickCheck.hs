-- QuickChick.hs

module QuickCheck where

-- cabal install QuickCheck
import Test.QuickCheck

-- prop xs = (length $ tail xs) == ((length xs) -1)
-- > quickCheck prop

-- *** Failed! Exception: 'Prelude.tail: empty list' (after 1 test):

-- []
-- prop xs = not (null xs) ==> (length $ tail xs) == ((length xs) -1)
-- to get more details
-- > quickCheck (verbose prop)
prop xs = not (null xs) ==> (length $ tail xs) === ((length xs) -1)
