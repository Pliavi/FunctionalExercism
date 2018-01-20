module Grains (square, total) where

-- Weird i know, but, i'll try to improve this xD

square :: Integer -> Maybe Integer
square n 
    | n > 0 && n < 65 = Just $ 2 ^ (n-1)
    | otherwise       = Nothing

total :: Integer
total = 2 ^ 64

