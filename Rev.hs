-- Rev.hs
-- Exercise from https://youtu.be/46dksIrx6jQ
-- Create reverse function using foldr 

rev :: [a] -> [a]
rev = foldl (\acc x -> x : acc) []

rev' :: [a] -> [a]
rev' =  foldr  (\x xs -> xs  ++ [x]) []
reverse' :: [a] -> [a]
reverse' = foldr (\x acc -> acc ++ [x]) []

-- rev2 = foldl (flip (:)) []

-- create a function prefixes that returns all the prefixes of a given list
prefixes :: [a] -> [a]
prefixes = foldr (\x xs -> [x]: (map ((:) x) xs)) []