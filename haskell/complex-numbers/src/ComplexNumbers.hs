module ComplexNumbers
(Complex,
 conjugate,
 abs,
 real,
 imaginary,
 mul,
 add,
 sub,
 div,
 complex) where

import Prelude hiding (div, abs)

-- Data definition -------------------------------------------------------------
data Complex a = Complex a a deriving (Eq, Show)

-- A complex number is a number in the form `a + b * i` where `a` and `b` are real and `i` satisfies `i^2 = -1`.
complex :: (a, a) -> Complex a
complex (a, b) = Complex a b

-- unary operators -------------------------------------------------------------
conjugate :: Num a => Complex a -> Complex a
conjugate = error "You need to implement this function"

abs :: Floating a => Complex a -> a
abs = error "You need to implement this function"

real :: Num a => Complex a -> a
real = error "You need to implement this function"

imaginary :: Num a => Complex a -> a
imaginary = error "You need to implement this function"

-- binary operators ------------------------------------------------------------
mul :: Num a => Complex a -> Complex a -> Complex a
mul = error "You need to implement this function"

add :: Num a => Complex a -> Complex a -> Complex a
add = error "You need to implement this function"

sub :: Num a => Complex a -> Complex a -> Complex a
sub = error "You need to implement this function"

div :: Fractional a => Complex a -> Complex a -> Complex a
div = error "You need to implement this function"
