module DNA (nucleotideCounts) where

import Data.Map (Map, fromList)

nucleotideCounts :: String -> Either String (Map Char Int)
nucleotideCounts xs 
    | validate xs = Right $ fromList [('A', c 'A'), ('C', c 'C'), ('G', c 'G'), ('T', c 'T')]
    | otherwise   = Left "Invalid Sequence" 
    where c = nucleotideCount xs

validate :: String -> Bool
validate xs = length xs - length (filter (`elem` "ACGT") xs) == 0

nucleotideCount :: String -> Char -> Int
nucleotideCount xs x = length $ filter (==x) xs
