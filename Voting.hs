-- voting.hs 
-- Programming In Haskell -- Ch 7 -- Voting algorithm
module Voting where
import Data.List
import System.IO


--1- First past the post 
votes = ["Red", "Blue", "Green", "Blue", "Blue", "Red"]
-- count
count :: Eq a => a -> [a] -> Int
count x = length . filter (== x)

-- remove duplicates
rmdups:: Eq a => [a] -> [a]
rmdups [] = []
rmdups (x:xs) = x : filter (/= x) (rmdups xs)


result :: Ord a => [a] -> [(Int, a)]
result vs = sort [(count v vs, v) | v <- rmdups vs]

winner :: Ord a => [a] -> a
winner = snd . last . result

-- 1 end 

--2- Alternative vote 
ballots :: [[String]]
ballots = [["Red", "Green"],["Blue"],["Green", "Red", "Blue"],["Blue", "Green", "Red"],["Green"]]

-- remove empty
rmempty :: Eq a => [[a]] -> [[a]]
rmempty = filter (/= [])

-- eliminate given candidate from each ballot
elim :: Eq a => a -> [[a]] -> [[a]]
elim x = map (filter (/= x))


-- rank 1st choice - smaller to bigger
rank :: Ord a => [[a]] -> [a]
rank = map snd . result . map head

-- alternative vote algorithm
winner' :: Ord a => [[a]] -> a
winner' bs = case rank (rmempty bs) of
              [c] -> c
              (c:cs) -> winner' (elim c bs)

-- 2 end