-- let in
sumSquareOrSquareSum x y =
  let sumSquare = (x ^ 2 + y ^ 2)
      squareSum = (x + y) ^ 2
   in if sumSquare > squareSum
        then sumSquare
        else squareSum

-- overwrite
overwrite x =
  let x = 2
   in let x = 3
       in let x = 4
           in x
-- redfine overwirte using lambdas
overwrite x =
  ( \x ->
      ( \x ->
          (\x -> x) 4
      )
        3
  )
    2
