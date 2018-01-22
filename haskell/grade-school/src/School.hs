module School (School, add, empty, grade, sorted) where

type School = [(Int, String)]
-----

add :: Int -> String -> School -> School
add gradeNum student school = 
    (gradeNum, student) : school

empty :: School
empty = []

grade :: Int -> School -> [String]
grade gradeNum school = 
    map snd $ filter (\x -> fst x == gradeNum) school

-- a lot of errors i didn`t understand happened here xD
sorted :: School -> [(Int, [String])]
--sorted = map (\ f -> (fst f, grade $ (fst f) f))
sorted school = do 
     let f = head school
     show $ fst f
     grade $ fst f f
     return (1, ["asd"])