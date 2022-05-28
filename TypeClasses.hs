module TypeClasses where
import Data.List
import System.IO

-- Num Eq Ord Show
-- example (+) Num

data Employee = Employee {name :: String,
                          position::String,
                          idNum:: Int} deriving (Show, Eq)

samSmith = Employee {name ="Sam Smith", position = "Manager", idNum =123414}
maoZhang = Employee {name ="Mao Zhang", position = "Marketing", idNum =22124}

isSamMao = samSmith == maoZhang
maoZhangData = show maoZhang


-- ShirtSize
data ShirtSize = S | M | L

instance Eq ShirtSize where
        S == S = True
        M == M = True
        L == L = True
        _ == _ = False

instance Show ShirtSize where
        show S = "Small"
        show M = "Medium"
        show L = "Large"

smallAvailable = S `elem` [S, M, L]

theSize = show S