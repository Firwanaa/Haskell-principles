($) :: (a  ->  b) ->    a ->    b
--      function  takes a gives b
-- f (1 + 2) == f $ 1 + 2 -- Basically it replace brakets

-- Type signature of (fmap)
fmap  :: Functor f => (a -> b) -> f a -> f b
(<$>) :: Functor f => (a -> b) -> f a -> f b
-- (a, b): is a function that takes "a" and gives "b"
-- (f  a): "a" is value wrapped inside of a context "f". f is some sort of container or data structure like "Maybe"
-- (f  b): "b" is a result value wrapped inside a container "f".

-- Examples
fmap (+1) [1..3]
fmap (+1) []
fmap (+1) (Just 1)
fmap (+1) (Nothing)

(<*>) :: Functor f => f (a -> b) -> f a -> f b
-- same goes here BUT everything wrapped in some functorial container "f" even the function
data Maybe a = Just a | Nothing -- refresher
-- Examples

Just (+1) <*> Just 1
Just (+1) <*> Nothing
Nothing   <*> Just 1
Nothing   <*> Nothing

(>>=) :: Monad m => m a -> (a -> m b) -> m b -- the context here is Monad.
-- (m b): "b" is a value wrapped in a monadic container
-- Examples
Just 1  >>= \x -> Just (x+1)
--m  a  ->  (a -> m       b) will result in   (m b)
Just 1  >>= \x -> Nothing
Nothing >>= \x -> Just (x+1)
Nothing >>= \x -> Nothing

-- using "Either" container
-- data Either a b = Left a | Right b
-- Right is success and Left is failure
-- ($)
-- ($) :: (a  ->  b) ->    a ->    b
show $ 1
-- > "1"

-- (<$>) fmap
-- (<$>) :: Functor f => (a -> b) -> f a -> f b
show <$> Right 1
-- > Right "1"
(<$>) show (Right 1)
-- > Right "1" -- it took the vlaue 1 as number,unwrapped it, and wrapped it again as string "1"
show <$> Left "string"
-- Left "string"
show <$> Left 0 -- Left is failure, like Nothing in Maybe
-- > Left 0

-- (<*>)
-- (<*>) :: Functor f => f (a -> b) -> f a -> f b
Right show <*> Right 1
-- > Right "1"
(<*>) (Right show) (Right 1) -- same thing, just using prefix
Right show <*> Left "string"
-- > Left "string" -- returning (Left "string") without applying show, see next two examples
(<*>) (Right (+1)) (Right 1)
-- > Right 2
(<*>) (Right (+1)) (Left 1)
-- > Left 1
(<*>) (Left show) (Left 1)
-- > error !

-- (>>=)
-- (>>=) :: Monad m => m a -> (a -> m b) -> m b -- the context here is Monad.
Right 1 >>= (\x -> Right (show x))
-- > Right "1"
Left  1 >>= (\x -> Right (show x))
-- > Left 1 -- fail case
-- using prefix
(>>=) (Left 1) (\x -> Right (show x))
-- > Left 1 -- fail
Right 1 >>= (\x -> Left (show x))
-- > Left "1" -- unwrap the numeric value, wrap it with "Left" and make it string using "show"
Left "1" >>= (\x -> Left (show x))
  -- > Left "1"
