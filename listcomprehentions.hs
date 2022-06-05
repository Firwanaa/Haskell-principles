module ListComprehensions where
import Data.List
import System.IO

sumSqr = sum [x^2 | x <- [1..100]]

grid n m = [(x,y) | x <- [0..m], y <- [0..n]]


