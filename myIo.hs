import Data.Char
import Data.IntMap.Merge.Lazy (mapWhenMatched)
import Distribution.Simple.LocalBuildInfo (InstallDirs (docdir), depLibraryPaths)

-- some IO action
hw :: IO ()
hw = putStrLn "Hello World"

greet :: IO ()
greet = do
  putStrLn "What's your name?"
  name <- getLine
  let uname = map toUpper name
  putStrLn ("Hello " ++ uname ++ ".")

main :: IO ()
main = do
  i <- getLine
  if i /= "quit"
    then do
      -- do must be used again
      putStrLn ("Input: " ++ i)
      main
    else return ()
