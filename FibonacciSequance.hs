-- FibonacciSequance.hs
module FibonacciSequance where
import Data.List
import System.IO

fib = 1 : 1 :[a+b|(a,b)<- zip fib(tail fib)]

fib300 = fib !! 300