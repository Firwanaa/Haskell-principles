--- Prime.hs
module Prime where
import Data.List
import System.IO

factors n = [x | x <- [1..n], n `mod` x == 0]

isPrime n = factors n == [1,n]

-- list of prime prime numbera
primes n = [x | x <- [2..n], isPrime x]

