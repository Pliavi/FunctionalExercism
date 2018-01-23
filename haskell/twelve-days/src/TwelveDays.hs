module TwelveDays (recite) where

recite :: Int -> Int -> [String]
recite start stop = map mainphrase [start .. stop ]

mainphrase :: Int -> String
mainphrase 1 = 
    "On the first day of Christmas my true love gave to me, a Partridge in a Pear Tree."

mainphrase day = 
    "On the " ++ days !! (day-2)  ++ " day of Christmas my true love gave to me, " 
    ++ (concat . reverse) (take day gifts)

days :: [String]
days = [
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eighth",
    "ninth",
    "tenth",
    "eleventh",
    "twelfth"]

gifts :: [String]
gifts = [
    "and a Partridge in a Pear Tree.",
    "two Turtle Doves, ",
    "three French Hens, ",
    "four Calling Birds, ",
    "five Gold Rings, ",
    "six Geese-a-Laying, ",
    "seven Swans-a-Swimming, ",
    "eight Maids-a-Milking, ",
    "nine Ladies Dancing, ",
    "ten Lords-a-Leaping, ",
    "eleven Pipers Piping, ",
    "twelve Drummers Drumming, "]
