-- reverse.hs
module Reverse where
import Data.List
import Text.XHtml (rev)

rvrs :: String -> String
rvrs x = drop 9 x ++ " " ++ take 2 (drop 6 x) ++ " " ++ take 5 x


main:: IO()
main = print(rvrs "Curry is awesome!")


isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome x = x == reverse x