-- Records.hs

module Records where

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
data Temprature = C Float | F Float

instance Eq Temprature where
  (==) (C n) (C m) = n == m
  (==) (F n) (F m) = n == m
  (==) (C c) (F f) = (1.8 * c + 32) == f
  (==) (F f) (C c) = (1.8 * c + 32) == f
