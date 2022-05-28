-- lists.hs
module Lists where
primesNumbers = [2,5,7,11]
morePrimes = primesNumbers ++ [13, 17, 19, 23, 29]
favNumes = 2:7:21:66:[]

multiList = [[3,5,7],[11, 13,17]]

morePrimes2 = 2 : morePrimes

listTimes2 = [x*2 | x <- [1..10]]

as = take 10 (repeat 'a')
lettersList = ['A', 'B'..'Z']
evensList = [2,4..100]