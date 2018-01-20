module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify x
    |          x <  1 = Nothing
    | aliquotSum == x = Just Perfect
    | aliquotSum  > x = Just Abundant
    | aliquotSum <  x = Just Deficient
    where
        aliquotSum = sum [ i | i <- [1..x-1], x `rem` i == 0 ]
