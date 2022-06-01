-- Haskell Programming - Graham Hutton
-- Seqn.hs
module Seqn where
import Data.List
import System.IO

seqn [] = []
seqn (act:acts) = do x <- act
                     xs <- acts
                     return (x:xs)

product1 [] = 1
product1 (n : ns) = n * product ns