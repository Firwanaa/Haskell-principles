-- print3broken.hs
module Print3Broken where
greeting :: [Char]
greeting = "Yarrrrr"
printSecond :: IO ()
printSecond = do
 putStrLn greeting

main :: IO ()
main = do
 putStrLn greeting
 printSecond

