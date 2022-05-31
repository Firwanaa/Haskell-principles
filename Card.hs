-- Card.hs --
-- Algebraic dataTyes
module Card where

import Data.List
import System.Console.Terminfo (Color (Black))
import System.IO

data Suit = Clubs | Diamonds | Hearts | Spades deriving (Show, Eq, Ord)

data Colour = Red | Black deriving (Show, Eq, Ord)

data Value
  = Two
  | Three
  | Four
  | Five
  | Six
  | Seven
  | Eight
  | Nine
  | Ten
  | Jack
  | Queen
  | King
  | Ace
  deriving (Show, Eq, Ord)

data Card = Card
  { suit :: Suit,
    colour :: Colour,
    value :: Value
  }deriving (Show,Eq,Ord)
-- queenDiamonds :: Card
queenDiamonds = Card Diamonds Red Queen

-- Another way
jackDiamonds = Card {suit = Diamonds, colour = Red, value = Jack}