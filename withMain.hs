-- withMian.hs
module Main where
import Data.List
import System.IO

main = do
 putStrLn "Whats your name?"
 name <- getLine
 putStrLn ("Hello " ++ name)