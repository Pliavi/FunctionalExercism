module RunLength (decode, encode) where

decode :: String -> String
decode encodedText = error "You need to implement this function."

encode :: String -> String
encode text = error "You need to implement this function."


--countLetters [] qtd = ("", 0, "")
--countLetters [x] qtd = (x, qtd, "")
--countLetters (x:xs) qtd = 
--    if x == head xs
--        then countLetters xs (qtd+1)
--        else (x, qtd, xs)

countLetters :: String -> Int -> String -> String
countLetters [] qtd res = res
countLetters [x] qtd res = res++[x]++show qtd
countLetters (x:xs) qtd res = 
    if x == head xs
        then countLetters xs (qtd+1) res
        else do 
            countLetters (tail xs) 1 res
            return (res++[x]++show qtd)