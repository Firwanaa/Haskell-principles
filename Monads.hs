import Data.Char
import GHC (Convertable (convert))

-- Monads.hs
-- Programming in Haskell - Ch 12 - Monads
-- Monad I
-- (>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b
-- mx >>= f = case mx of
-- 	     Nothing -> Nothing
-- 	     Just x = f x

data Expr = Val Int | Div Expr Expr

-- eval :: Expr -> Int
-- eval (Val n) = n
-- eval (Div x y) = eval x `div` eval y

safediv :: Int -> Int -> Maybe Int
safediv _ 0 = Nothing

savediv n m = Just (n `div` m)

-- eval :: Expr -> Maybe Int
-- eval (Val n) = Just n
-- eval (Div x y) = case eval x of
-- 	           Nothing -> Nothing
-- 		   Just n -> case eval y of
-- 			Nothing -> Nothing
-- 			Just m -> safediv n m

-- now lets try applicative style
-- eval :: Expr -> Maybe Int
-- eval (Val n) = pure n
-- eval (Div x y) = pure safedive <*> eval x <*> eval y -- which is not correct because safediv returns Maybe type
-- because applicative style restricts us to applying functions to effectful argument

-- eval :: Expr -> Maybe Int
-- eval (Val n) = Just n
-- eval (Div x y) = eval x >>= \n -> -- if x evaluation is successful then
--                  eval y >>= \m -> -- if y evaluation is successful then
--                  safediv n m

-- General Pattern
-- m1 >>= \x1 ->
-- m2 >>= \x2 ->
-- .
-- .
-- .
-- .
-- mn >>= \xn ->
-- f x1 x2 ... xn

-- Haskell provides special notation for expressions of the above form
{- do x1 <- m1
      x2 <- m2
      .
      .
      .
      xn <- mn
      f x1 x2 ... xn
-}

-- eval can now be redefined simply as:
eval :: Expr -> Maybe Int
eval (Val n) = Just n
eval (Div x y) = do
  n <- eval x
  m <- eval y
  safediv n m

-- Monad II
-- Examples
-- Lists
-- instance Monad [] where
--         -- (>>=) :: [a] -> (a -> [b]) -> [b]
--         xs >>= f = concat (map f xs) -- [y | x <- xs, y <- f x]

pairs' :: [a] -> [b] -> [(a, b)]
pairs' xs ys = do
  x <- xs
  y <- ys
  return (x, y)

-- using list comprehension
-- pairs :: [a] -> [b] -> [(a,b)]
-- pairs xs ys = [(x,y) | x <- xs, y <- ys]

{-
The difference is that the pairs' monadic definition (do notation) can be used to any arbitrary monad,
however, the list comprehension style is limited to type of lists.
-}

-- State Monads
-- type State = ..
-- State is a value that possibly changes over time.

type State = Int

-- State Transformer
newtype ST a = S (State -> (a -> State))

-- to get rid of  dummy constructor
-- app :: ST a -> State -> (a, State)
-- app (S st) x = st x

-- instance Functor ST where
--          -- fmap :: (a -> b) -> ST a -> ST b
--          fmap g st = S (\s -> let (x,s') = app st s in (g x, s'))

-- instance Applicative ST where
--           -- pure :: a -> ST a
--           pure x = S (\s -> (x,s))

-- instance Monad ST where
--         -- return :: a  -> ST a
--         return x = S(\s -> (x, s))
--         -- (>>=) :: ST a -> (a -> ST b) -> ST b
--         st >>= f = S(\s -> let (x,s') = app st s in app (f x) x')

-- Generic functions

mapM' :: Monad m => (a -> m b) -> [a] -> m [b]
mapM' f [] = return []
mapM' f (x : xs) = do
  y <- f x
  ys <- mapM' f xs
  return (y : ys)

-- convert digit charater to its numeric value ("12" -> [1,2])
conv :: Char -> Maybe Int
conv c
  | isDigit c = Just (digitToInt c)
  | otherwise = Nothing

concat :: [[a]] -> [a]
concat xss = [x | xs <- xss, x <- xs]

join :: Monad m => m (m a) -> m a
join mmx = do
  mx <- mmx
  x <- mx
  return x

-- Monad Laws
-- return  x >>= f = f x
-- mx >>= return = mx
-- (mx >>= f) >>= g = mx >= (\x -> (f x >>= g))
