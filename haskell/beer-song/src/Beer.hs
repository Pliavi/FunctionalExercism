module Beer (song) where

ofBeer :: Int -> String
ofBeer 0 = "no more bottles "
ofBeer 1 = "1 bottle "
ofBeer bottles = show bottles ++ " bottles "

phrase :: Int -> String
phrase 0 = "No more bottles of beer on the wall, no more bottles of beer.\n\
            \Go to the store and buy some more, 99 bottles of beer on the wall.\n"

phrase 1 = "1 bottle of beer on the wall, 1 bottle of beer.\n\
            \Take it down and pass it around, no more bottles of beer on the wall.\n\n"

phrase bottles = ofBeer bottles ++ "of beer on the wall, " ++ ofBeer bottles ++ "of beer.\n\
                  \Take one down and pass it around, " ++ ofBeer (bottles-1) ++ "of beer on the wall.\n\n"

song :: String
song = concatMap phrase [99, 98..0]