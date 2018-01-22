module ETL (transform, setScore) where

import Data.Map (Map, fromList, toList)
import Data.Char (toLower)

transform :: Map a String -> Map Char a
transform l = fromList (concatMap (uncurry setScore) (toList l))

setScore :: a -> String -> [(Char, a)]
setScore score chars = zip (strToLower chars) (repeat score)

strToLower :: String -> String
strToLower = map toLower