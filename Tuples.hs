-- Tuples.hs

module Tuples where
import Data.List
import System.IO

randTuple = (1, "Random Tuple")
bobSmith = ("Bob Smith", 52)

bobName = fst bobSmith
bobAge = snd bobSmith


names = ["Bob", "Mary", "Tom"]
addresses = ["123 Main", "234 North", "532 West"]

namesNAddresses = zip names addresses