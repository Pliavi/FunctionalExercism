module Isogram (isIsogram) where

import Data.List
import Data.Char

isIsogram :: String -> Bool
isIsogram str = do
    let lowerStr = map toLower str
    let testStr  = nubBy (\x y -> isLetter x && x == y) lowerStr
    testStr == lowerStr


