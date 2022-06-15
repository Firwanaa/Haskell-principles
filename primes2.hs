-- primes2.hs
-- Prime numbers in a  Sieve Of Eratosthenes way
primes = sieve [2 ..]

sieve (p : xs) = p : sieve [x | x <- xs, mod x p /= 0] -- ❤️

-- to test it
-- in ghci
-- take 10 primes
-- takeWhile (<50) primes

-- Twin priems: the two primes that differ by two, eg. 3 and 5
-- me
-- tp = twinprime [2 ..]

-- twinprime (p : xs) = p : twinprime [x | x <- sieve xs, (x - p) == 2]

-- Prof Graham

twin (x, y) = y == x + 2

twins = filter twin (zip primes (tail primes))
