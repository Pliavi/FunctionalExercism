module DNA (toRNA) where

toRNA :: String -> Maybe String
toRNA = mapM transcribe

transcribe :: Char -> Maybe Char
transcribe nucleotide
    | nucleotide == 'G' = Just 'C'
    | nucleotide == 'C' = Just 'G'
    | nucleotide == 'T' = Just 'A'
    | nucleotide == 'A' = Just 'U'
    | otherwise         = Nothing
