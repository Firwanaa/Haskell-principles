-- Monads.hs
-- Programming in Haskell - Ch 12 - Monads

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

eval :: Expr -> Maybe Int
eval (Val n) = Just n
eval (Div x y) = eval x >>= \n ->
                 eval y >>= \m ->
                 safediv n m