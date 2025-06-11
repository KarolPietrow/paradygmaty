-- 1
addMe :: Integer -> Integer -> Integer
addMe x y = x + y

main :: IO ()
main = do
    putStr "Sum of x + y = "
    print (addMe 10 25)

-- 2
-- Napisz następujące funkcje:
-- - square, która dla podanej liczby zwróci jej kwadrat.
-- - cube, która dla podanej liczby zwróci jej sześcian.
-- - average, która przyjmuje dwie liczby i zwraca ich średnią.
square :: Integer -> Integer
square x = x * x

cube :: Integer -> Integer
cube x = x * x * x

average :: Fractional a => a -> a -> a
average x y = (x + y) / 2

main :: IO ()
main = do
  print(square 5)
  print(cube 5)
  print(average 1 5)

-- 3
-- Napisz kod rozwiązujący równanie kwadratowe. W wersji I wykorzystaj konstrukcję if..else. W wersji II skorzystaj z dozorów/strażników (konstrukcja typu "case").
fun :: Float -> Float -> Float -> (Float, Float)
fun a b c =
  if delta >= 0
    then ((-b + sqrt delta) / (2 * a), (-b - sqrt delta) / (2 * a))
  else error "Ujemna delta"
  where
    delta = b * b - 4 * a * c

main :: IO ()
main = do
  print(fun 3 10 1)

-- (wersja II niezrobiona)    

-- 4
-- Zaimplementuj funkcję obliczającą silnię.
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = do
  print(factorial 0)
  print(factorial 5)
  print(factorial 10)

-- 5
-- Napisz funkcję wyznaczającą kolejne wyrazy ciągu Fibonacciego.
fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

main :: IO ()
main = do
  print(fib 0)
  print(fib 1)
  print(fib 6)
  print(fib 10)

-- 6
-- Napisz funkcję, która pobiera trzy liczby i zwraca różnicę między największą i najmniejszą liczbą.
minmax :: Integer -> Integer -> Integer -> Integer
minmax x y z = maximum [x, y, z] - minimum [x, y, z]

main :: IO ()
main = do
  print(minmax 7 1 4)

-- 7
-- Zaimplementuj funkcję, która pobiera dwie liczby i znajduje sumę ich kwadratów.
sumOfSquares :: Integer -> Integer -> Integer
sumOfSquares x y = (x*x) + (y*y)

main :: IO ()
main = do
  print(sumOfSquares 3 4)

-- sumOfSquares :: Num a => a -> a -> a
-- sumOfSquares x y = x * x + y * y

-- 8
-- Zaimplementuj funkcję zwracającą ostatnią cyfrę danej liczby.
lastDigit :: Int -> Int
lastDigit x = abs x `mod` 10

main :: IO ()
main = do
  print(lastDigit(42))
  print(lastDigit(-17))
