-- Enumerations
module Enumerations where
import Data.List
import System.IO

data BaseballPlayer = Pitcher
                | Catcher
                | Infielder 
                | Outfield
        deriving (Eq, Show)

barryBonds :: BaseballPlayer -> Bool
barryBonds Outfield = True

barryInOF = print(barryBonds Outfield)
