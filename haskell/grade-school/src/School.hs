module School (School, add, empty, grade, sorted) where

data School = List

add :: Int -> String -> School -> School
add gradeNum student school = school

empty :: School
empty = []

grade :: Int -> School -> [String]
grade gradeNum school = error "You need to implement this function."

sorted :: School -> [(Int, [String])]
sorted school = error "You need to implement this function."
