-- Print3.hs
module Print3 where

myGreeting :: String
myGreeting = "Hello" ++ " World!"

hello :: String
hello = "hello"

world :: [Char]
world = "World!"

main :: IO ()
main = do
  putStrLn myGreeting
  putStrLn secondGreeting
  where secondGreeting = 
         concat [hello, " ", world]