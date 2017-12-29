module IsbnVerifier (isbn) where
import Data.Char

isbn            :: [Char] -> Bool
isCorrectLength :: [Char] -> Bool
isValidString   :: [Char] -> Bool
removeDash      :: [Char] -> [Char]
calculate       :: [Char] -> Int

isValidString [letter] = 
    letter `elem` "0123456789xX"
isValidString (code:restOfCode) 
    | not(code `elem` "0123456789") = False 
    | otherwise                     = isValidString restOfCode

removeDash [letter]
    | letter `elem` "-" = []
    | otherwise         = [letter]
removeDash (code:restOfCode)
    | code `elem` "-" = removeDash restOfCode
    | otherwise       = code : removeDash restOfCode

isCorrectLength code = 
    (length (removeDash code)) == 10

calculate [x] = 
    if [x] == "x" || [x] == "X" 
        then 10
        else digitToInt x
calculate (x:xs) = 
    (digitToInt x) * ((length xs) + 1) + calculate(xs)
    
isbn code 
    | not(isCorrectLength code)                 = False
    | not(isValidString (removeDash code))      = False
    | calculate (removeDash code) `mod` 11 == 0 = True
    | otherwise                                 = False


