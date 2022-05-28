module FunctionWithLet where
import Distribution.SPDX (LicenseId(RPL_1_5))

printInc n = print plusTwo
  where
    plusTwo = n + 2

printInc2 n = let plusTwo = n + 2
              in print plusTwo

mult1    = x * y
 where x = 5
       y = 6

mult3      = x * 3 + y
 where   x = 3
         y = 1000

triple x = x * 3

waxOn     = x * 5
 where  z = 7
        y = z + 8
        x = y ^ 2

waxOff x = triple x