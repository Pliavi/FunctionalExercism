module Diamond (diamond) where

diamond :: Char -> [String]
diamond char = do
    let size = length ['A'..char] - 1
    map (drawline size) (['A' .. char] ++ drop 1 (reverse ['A' .. char]))

-- what a crazy thing i did!
drawline :: Int -> Char -> String
drawline dis 'A' = dots dis ++ ['A'] ++ dots dis
drawline dis char = do
    let ins  = length ['A'..char] - 1
    let ndis = dis - ins
    let nins = ins * 2 - 1
    dots ndis ++ [char] ++ dots nins ++ [char] ++ dots ndis

dots :: Int -> String
dots s = replicate s ' '