-- Applicative.hs
-- Programming in Haskell - Ch 12
-- Applicative
module Applicative where


-- pure :: a -> f a 

-- funny star operator
-- applicative style
-- (<*>) :: f (a -> b) -> f a -> f b

-- instance Applicative Maybe where
-- 	-- pure :: a -> Maybe a 
-- 	pure x = Just x
-- 	-- (<*>) :: Maybe (a->b) -> Maybe a -> Maybe b
-- 	Nothing  <*> _  = Nothing
-- 	(Just g) <*> mx = fmap g mx

-- examples
-- > pure (+1) <*> (Just 1)