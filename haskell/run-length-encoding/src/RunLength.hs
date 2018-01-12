module RunLength (decode, encode) where
import Regex.
decode :: String -> String
decode encodedText = error "You need to implement this function."

encode :: String -> String
encode text = error "You need to implement this function."


countLetters :: String -> Int -> String -> String
countLetters [] qtd res = res
countLetters [x] qtd res = res++[x]++show qtd
countLetters (x:xs) qtd res = 
    if x == head xs
        then countLetters xs (qtd+1) res
        else do 
            countLetters (tail xs) 1 res
            return (res++[x]++show qtd)