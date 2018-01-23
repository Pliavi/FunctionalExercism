module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard p (x:xs) = if p x then discard p xs else x : discard p xs
discard _ [] =  []

keep :: (a -> Bool) -> [a] -> [a]
keep p (x:xs) = if p x then x : keep p xs else keep p xs
keep _ [] = []
