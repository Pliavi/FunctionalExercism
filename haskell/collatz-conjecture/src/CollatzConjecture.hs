module CollatzConjecture (collatz) where

-- *NOT TESTED*, i cant download all the `stack test` dependencies now
-- By using ghc i could "test" some things, and reading this: 
-- https://www.fpcomplete.com/blog/2012/09/ten-things-you-should-know-about-haskell-syntax
-- I learned, function call in Haskell is bizarre hahaha

collatz :: Integer -> Maybe Integer
collatz n
    | n < 1     = Nothing
    | otherwise = Just $ getNumber n 0

getNumber :: Integer -> Integer -> Integer
getNumber n counter
    | 1 == n = counter
    | even n = getNumber (n `div` 2) counter + 1
    | odd  n = getNumber (n * 3 + 1) counter + 1
