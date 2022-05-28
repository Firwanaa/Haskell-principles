-- CustomTypes.hs
module CustomTypes where
import Data.List
import System.IO

data Customer = Customer String String Double
 deriving Show

tomSmith :: Customer
tomSmith = Customer "Tom smith" "123 Main" 20.39

getBalance :: Customer -> Double
getBalance (Customer _ _ b) = b

data RPS = Rock | Paper | Scissors
shoot :: RPS -> RPS ->String
shoot Paper Rock = "Paper Beats Rock"
shoot Rock Scissors = "Rock Beat Scissors"
shoot Scissors Paper = "Scissors Beats Paper"
shoot Scissors Rock = "Scissors Loses to Rock"
shoot Paper Scissors = "Paper Loses to Scissors"
shoot Rock Paper= "Rock Loses to Paper"
shoot _ _ = "Error"


data Shape = Circle Float Float Float | Rectangle Float Float Float Float
 deriving Show

area :: Shape -> Float
area (Circle _ _ r) = pi * r ^ 2
-- area (Rectangle x y x2 y2) = (abs (x2 - x)) * (abs (y2-y))
area (Rectangle x y x2 y2) = (abs $x2 - x) * (abs $y2-y)

-- dot operator
sumValue = putStrLn (show (1+2))
sumValue2 = putStrLn. show $1+4

areaOfCirlcle = area (Circle 50 60 20)
areaOfRect = area $Rectangle 10 10 20 20