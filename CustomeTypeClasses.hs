-- CustomeTypeClasses.hs
module CustomeTypeClasses where

class MyEq a where
        areEqual :: a -> a -> Bool
-- ShirtSize
data ShirtSize = S | M | L

instance Eq ShirtSize where
  S == S = True
  M == M = True
  L == L = True
  _ == _ = False

instance MyEq ShirtSize where
        areEqual S S = True
        areEqual M M = True
        areEqual L L = True
        areEqual _ _ = False

newSize = areEqual M M
        
data Temprature = C Float | F Float deriving (Show, Eq)
-- instance Eq Temprature where
--         (==) (C n) (C m) = n == m
--         (==) (F n) (F m) = n == m
--         (==) (C c) (F f) = (1.8*c + 32) == f
--         (==) (F f) (C c) = (1.8*c + 32) == f
