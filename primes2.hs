-- primes2.hs
-- Prime numbers in a  Sieve Of Eratosthenes way
primes = sieve [2 ..]

sieve (p : xs) = p : sieve [x | x <- xs, mod x p /= 0] -- ❤️

-- to test it
-- in ghci
-- take 10 primes
-- takeWhile (<50) primes
