-- ch4-1.hs
module Ch4 where
data Mood = Blah | Woot deriving Show

-- pattern matching
changeMood :: Mood -> Mood
changeMood Blah = Woot 
changeMood _ = Blah
 
f x = \x -> x + 1