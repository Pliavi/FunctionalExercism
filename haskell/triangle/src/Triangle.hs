module Triangle (TriangleType(..), triangleType) where

data TriangleType = Equilateral
                  | Isosceles
                  | Scalene
                  | Illegal
                  deriving (Eq, Show)

triangleType :: (Ord a, Num a) => a -> a -> a -> TriangleType
triangleType a b c 
    | zeroOrLess || isInequal    = Illegal
    | (a, b) == (b, c)           = Equilateral
    | a == b || b == c || c == a = Isosceles
    | (a, b) /= (b, c)           = Scalene
    where
        zeroOrLess = a <= 0 || b <= 0 || c <= 0
        isInequal  = a + b < c || b + c < a || a + c < b