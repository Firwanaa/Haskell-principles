--RelabellingTrees.hs

module RelabllingTrees where

type State = Int

newtype ST a = S (State -> (a, State))

app :: ST a -> State -> (a, State)
app (S st) x = st x

instance Functor ST where
  -- fmap :: (a -> b) -> ST a -> ST b
  fmap g st = S (\s -> let (x, s') = app st s in (g x, s'))

instance Applicative ST where
  -- pure :: a -> ST a
  pure x = S (\s -> (x, s))

  -- (<*>) :: ST (a -> b) -> ST a -> ST b
  stf <*> stx =
    S
      ( \s ->
          let (f, s') = app stf s
              (x, s'') = app stx s'
           in (f x, s'')
      )

instance Monad ST where
  -- return :: a -> ST a
  return x = S (\s -> (x, s))

  -- (>>=) :: ST a -> (a -> ST b) -> ST b
  st >>= f = S (\s -> let (x, s') = app st s in app (f x) s')

data Tree a = Leaf a | Node (Tree a) (Tree a) deriving (Show)

-- our tree
tree :: Tree Char
tree = Node (Node (Leaf 'a') (Leaf 'b')) (Leaf 'c')

-- let's define a function that takes a tree a -> tree Int
-- Due to it's complexity, Prof. Graham himself do not recommend writing this kind of code, it can be done differently.
rlable :: Tree a -> Int -> (Tree Int, Int)
rlable (Leaf _) n = (Leaf n, n + 1)
rlable (Node l r) n = (Node l' r', n'')
  where
    (l', n') = rlable l n
    (r', n'') = rlable l n'

fresh :: ST Int
fresh = S (\n -> (n, n + 1))

-- mlabel
mlabel :: Tree a -> ST (Tree Int)
mlabel (Leaf _) = do
  n <- fresh
  return (Leaf n)
mlabel (Node l r) = do
  l' <- mlabel l
  r' <- mlabel r
  return (Node l' r')
