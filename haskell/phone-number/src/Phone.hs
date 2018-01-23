module Phone (number) where

import Data.Char

number :: String -> Maybe String
number xs
    | checkLetters xs                         = Nothing
    | checkNumber (clear xs) && size xs == 11 = Just $ tail $ clear xs
    | checkNumber (clear xs) && size xs == 10 = Just $ clear xs
    | otherwise                               = Nothing

clear:: String -> String
clear = filter isNumber

size :: String -> Int
size xs = length $ clear xs 

check2to9 :: Char -> Bool
check2to9 x = x `elem` ['2'..'9']

checkLetters :: String -> Bool
checkLetters = all isLetter

checkNumber :: String -> Bool
checkNumber (x:xs)
    | size (x:xs) == 10 = 
        check2to9 x 
        && check2to9 (xs !! 2)
    | size (x:xs) == 11 = 
        x == '1' 
        && check2to9 (head xs) 
        && check2to9 (xs !! 3) 
    | otherwise = False
