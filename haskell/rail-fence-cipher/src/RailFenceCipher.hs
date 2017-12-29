module RailFenceCipher (encode, decode) where
import Data.List
import Data.Function

getSequence :: Int -> String -> [Int]
getSequence r text = take (length text) $ cycle ([0..r-1] ++ [r-2,r-3..1])

sortIndexes :: (Ord a) => [(a,b)] -> [(a,b)] 
sortIndexes = sortBy (compare `on` fst)

encode :: Int -> String -> String
encode r text = do
    let cleanText = filter (/= ' ') text    
    let indexed = (zip (getSequence r text) cleanText)
    
    return (snd(unzip(sortIndexes indexed)))!!0

decode :: Int -> String -> String
decode r text = do
    let cycle = (r * 2) - 2
    let num = floor((length text) / cycle)


    return (snd(unzip(reverse(sortIndexes indexed))))!!0

    