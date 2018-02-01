module Scrabble (scoreLetter, scoreWord) where

import Data.Char

scoreLetter :: Char -> Integer
scoreLetter letter 
    | check "AEIOULNRST" = 1
    | check "DG"         = 2
    | check "BCMP"       = 3
    | check "FHVWY"      = 4
    | check "K"          = 5
    | check "JX"         = 8
    | check "QZ"         = 10
    | otherwise          = 0
    where 
        uLetter = toUpper letter
        check xs = uLetter `elem` xs 

scoreWord :: String -> Integer
scoreWord = foldl (\x y -> x + scoreLetter y) 0
