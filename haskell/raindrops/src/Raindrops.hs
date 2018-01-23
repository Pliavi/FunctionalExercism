module Raindrops (convert) where

convert :: Int -> String
convert n = do
    let res = concatMap dropSound (factors n)    
    if res == "" then show n else res

factors :: Int -> [Int]
factors n = filter (\x -> n `mod` x == 0) [3, 5, 7]

dropSound :: Int -> String
dropSound 3 = "Pling"
dropSound 5 = "Plang"
dropSound 7 = "Plong"
dropSound _ = ""