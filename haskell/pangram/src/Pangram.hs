module Pangram (isPangram) where

import Data.Char
import Data.Set(toList, fromList) -- containers needed

isPangram :: String -> Bool
isPangram text =
    (length 
    $ uniq 
    $ filter (isLetter) text) == 26

uniq :: String -> String
uniq str = toList $ fromList $ map (toLower) str
