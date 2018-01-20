module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys 
    | length xs /= length ys = Nothing
    -- There is a way to use composition (.) here below to make more compact?
    | otherwise = Just $ length $ filter (==False) $ zipWith (==) xs ys 
