module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool

-- isLeapYear year 
--     | mod 400 == 0 = True
--     | mod 100 == 0 = False
--     | mod   4 == 0 = True
--     | otherwise    = False

-- Versão melhorada
isLeapYear year 
    | divisibleBy 400   = True
    | divisibleBy 100   = False
    | divisibleBy 4     = True
    | otherwise         = False
    where 
        divisibleBy x = 
            mod year x == 0
    

        

    

