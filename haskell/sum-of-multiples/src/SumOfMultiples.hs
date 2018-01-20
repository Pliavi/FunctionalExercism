module SumOfMultiples (sumOfMultiples) where
import Data.List

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = 
    sum $ nub $ concatMap (`filterMultiple` limit) factors

filterMultiple factor limit = 
    filter (\x -> x `rem` factor == 0) [1..limit-1]

