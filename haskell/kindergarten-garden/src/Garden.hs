module Garden
    ( Plant (..)
    --, defaultGarden
    --, garden
    --, lookupPlants
    , chunk
    ) where

    
import Data.Map (Map, fromList, toList)
import Data.List (sort)

data Plant = Clover
           | Grass
           | Radishes
           | Violets
           deriving (Eq, Show)

{- 
- ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry",]
-}

-- Credits to redxaxder from StackOverflow
chunk _ [] = []
chunk n list = first : chunk n rest
  where
    (first, rest) = splitAt n list

defaultGarden :: String -> Map String [Plant]
defaultGarden plants = do
    let rows = concatMap (chunk 2) (lines plants)
    let p = splitAt (length rows) rows
    fromList p

generatePlantGroup :: [String] -> [Plant]
generatePlantGroup xs = map determinePlant (concat xs)

determinePlant :: Char -> Plant
determinePlant 'R' = Radishes
determinePlant 'C' = Clover
determinePlant 'V' = Violets
determinePlant 'G' = Grass


garden :: [String] -> String -> Map String [Plant]
garden students plants = error "You need to implement this function."

lookupPlants :: String -> Map String [Plant] -> [Plant]
lookupPlants student garden = error "You need to implement this function."


 