-- Sequancing.hs
-- Programming In Haskell - Ch 10
{-# LANGUAGE BlockArguments #-}
module Sequancing where
import           Data.List
import           System.IO
-- "do" actions had to line up in the same column
act :: IO (Char,Char)
act = do x <- getChar
         getChar -- takes character but does'nt save it. used to discard "Enter" '\n'
         y <- getChar
         getChar -- discard another enter '\n'
         return (x,y)

getLine' :: IO String
getLine' = do x <- getChar
              if x == '\n' then
                return []
              else
                do xs <- getLine'
                   return (x:xs)
putStr' :: String -> IO ()
putStr' [] = return ()
putStr' (x:xs) = do putChar x
                    putStr' xs

putStrLn' :: String -> IO ()
putStrLn' xs = do putStr' xs
                  putChar '\n'

nameDo :: IO ()
nameDo = do
  putStr "What is your first name? "
  first <- getLine
  putStr "And your last name? "
  last <- getLine
  let full = first ++ " " ++ last
  putStrLn ("Pleased to meet you, " ++ full ++ "!")

strlen :: IO ()
strlen = do putStr "Enter a string: "
            xs <- getLine
            putStr "The string has "
            putStr (show (length xs))
            putStrLn " characters"