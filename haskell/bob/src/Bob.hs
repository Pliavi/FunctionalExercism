module Bob (responseFor) where
import Data.Char

responseFor :: String -> String
responseFor xs
    | isSilence  = "Fine. Be that way!"
    | isQuestion && isYell = "Calm down, I know what I'm doing!"
    | isQuestion = "Sure."
    | isYell     = "Whoa, chill out!"
    | otherwise  = "Whatever."
    where
        isQuestion = last(clearSpaces xs) == '?'
        isYell     = isAllCaps (clearSpaces xs)
        isSilence  = clearSpaces xs == ""

clearSpaces :: String -> String
clearSpaces str = filter (not . isSpace) str

isAllCaps :: String -> Bool
isAllCaps str = do
    let trueMap = map (isUpper) $ filter (isLetter) str
    if trueMap == []
        then False
        else and $ trueMap
    
