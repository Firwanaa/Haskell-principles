-- Records.hs

module Records where

import Data.Maybe

data Person = Person {name :: String, age :: Int}

greet :: Person -> [Char]
greet person = "Hi " ++ name person ++ " your age is: " ++ show (age person)

-- greet (Person name _) = "Hi " ++ name
-- greet (Person n _) = "Hi " ++ n

tom = Person "Tom" 44

-- greet tom => "Hi Tom your age is: 44"

data Point = D2 {x :: Int, y :: Int} | D3 {x :: Int, y :: Int, z :: Int} deriving (Show)

d2 = D2 1 2

d3 = D3 1 2 4

-- > x d2
-- > z d3

-- > z d2 => *** Exception: No match in record selector z

-- Typeclasses
data Temprature = C Float | F Float deriving (Show) -- here deriving Eq will be incorrect

instance Eq Temprature where
  (==) (C n) (C m) = n == m
  (==) (F n) (F m) = n == m
  (==) (C c) (F f) = (1.8 * c + 32) == f
  (==) (F f) (C c) = (1.8 * c + 32) == f

-- not equal will be implicitly defined

-- Maybe
-- data Maybe a = Nothing | Just a

safediv :: Integral a => a -> a -> Maybe a
safediv a b = if b == 0 then Nothing else Just $ div a b

-- safediv _ 0 = Nothing
-- savedive a b = Just (div a b)

-- import Data.Maybe
-- isJust :: Maybe a -> Bool
-- isNothing :: Maybe a -> Bool
-- fromJust :: Maybe a -> a -- Rust says "Hi!" BTW.
-- fromMaybe :: a -> Maybe a -> a

-- fromMaybe 3.1415   (Nothing) => 3.1415 -- Alright alright
--           default  Maybe
-- fromMaybe 3.1415 (Just 2.7183) => 2.7183
--           default  Maybe
--If the "Maybe" is "Nothing", "fromMaybe" function will return default, else it will return Maybe
