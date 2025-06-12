-- 1
main :: IO ()
main = do
  let x = takeWhile (<50) (map kw [0..])
  print(x)

kw :: Integer -> Integer
kw x = x*x

--

main :: IO ()
main = do
  let y = kw (snd ([1..],5))
  print(y)

kw :: Integer -> Integer
kw x = x*x

-- Haskell jest językiem funkcyjnym leniwej ewaluacji (lazy evaluation), co oznacza, że nie oblicza wartości, dopóki nie są one potrzebne.
-- Nieskończone listy nie są tworzone w całości. W 'snd ([1..], 5)' Haskell nie oblicza pierwszego elementu pary, jeśli nie jest on potrzebny.

-- 2
-- Rekurencyjny typ danych Tree a, który może być:
-- 1. EmptyTree — puste drzewo (liść / brak węzła)
-- 2. Node a left right — węzeł z wartością a oraz dwoma poddrzewami (left i right)
data Tree a = EmptyTree | Node a (Tree a) (Tree a)

-- Puste drzewo
emptyTree :: Tree Int 
emptyTree = EmptyTree 

-- Drzewo z jednym węzłem o wartości 5, bez dzieci
singleNode :: Tree Int 
singleNode = Node 5 EmptyTree EmptyTree 

--       10
--      /  \
--     5   15
--         /
--       12
exampleTree :: Tree Int
exampleTree = Node 10 (Node 5 EmptyTree EmptyTree) (Node 15 (Node 12 EmptyTree EmptyTree) EmptyTree)

-- Rekurencja na Tree - jeśli mamy EmptyTree to suma wynosi 0, jeśli mamy Node to dodajemy wartość węzła (value), sumę z lewego poddrzewa i sumę z prawego poddrzewa
sumTree :: Num a => Tree a -> a 
sumTree EmptyTree = 0 
sumTree (Node value left right) = value + sumTree left + sumTree right

main :: IO ()
main = do
  print(sumTree exampleTree)

-- 3
-- Napisz funkcję, która pobiera listę i zwraca tę samą listę z elementami w odwróconej kolejności, nie korzystając z gotowej funkcji reverse.
myReverse :: [a] -> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]

main :: IO ()
main = do
    print(myReverse[1,2,3,4])

-- 4
-- Skorzystaj z mechanizmu składania list w celu utworzenia tabliczki mnożenia. Tabela powinna być listą złożoną z trójelementowych krotek.
-- Pierwsze dwa elementy to liczby z zakresu 1..12, a trzeci to ich iloczyn.
multiplicationTable :: [[(Int, Int, Int)]]
multiplicationTable = [[(x, y, x * y) | y <- [1..12]] | x <- [1..12]]

main :: IO ()
main = do
    mapM_ print multiplicationTable

-- 5
-- Napisz funkcję, która generuje dwuelementowe krotki z wszystkimi możliwymi kombinacjami dwóch kolorów ze zbioru {black, white, blue, yellow, red}.
-- Wyeliminuj wyniki typu (red,red) oraz powtórzenia typu (red, yellow) - (yellow, red).
colors :: [String]
colors = ["black", "white", "blue", "yellow", "red"]

colorPairs :: [(String, String)]
colorPairs = [(c1, c2) | (i, c1) <- indexed, (j, c2) <- indexed, i < j]
  where
    indexed = zip [0..] colors

main :: IO ()
main = do
    print colorPairs

-- 6
-- Napisz następujące funkcje dla list:
-- a) append l m , która konkatenuje listy l i m,
append :: [a] -> [a] -> [a]
append []     m = m
append (x:xs) m = x : append xs m

-- b) member x l , która sprawdza, czy x jest elementem listy l,
member :: Eq a => a -> [a] -> Bool
member _ []     = False
member x (y:ys)
  | x == y    = True
  | otherwise = member x ys

-- c) last l, która znajduje ostatni element w liście,
getLast :: [a] -> a
getLast [x]    = x
getLast (_:xs) = getLast xs

-- d) delete x l, która skasuje element x z listy l
delete :: Eq a => a -> [a] -> [a]
delete _ [] = []
delete x (y:ys)
  | x == y    = ys
  | otherwise = y : delete x ys

-- e) split x l , która podzieli listę l do dwóch list l1 i l2. l1 zawiera elementy mniejsze niż x a l2 elementy większe niż x.
split :: Ord a => a -> [a] -> ([a], [a])
split _ [] = ([], [])
split x (y:ys)
  | y < x     = (y : l1, l2)
  | y > x     = (l1, y : l2)
  | otherwise = (l1, l2)
  where
    (l1, l2) = split x ys

main :: IO ()
main = do
    print(append [1,2] [3,4])
    print(member 5 [5,10,20,30])
    print(getLast [1,2,3,4,5,6,7,8,9,10])
    print(delete 5 [1,3,5,7,9])
    print(split 3 [0,2,4,6,8,10])


-- 7
-- Napisz funkcję filter p l, której wartością zwracaną jest lista wszystkich elementów listy l , które spełnią predykat p. Jaki ma typ funkcja filter?
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter _ []     = []
myFilter p (x:xs)
  | p x       = x : myFilter p xs
  | otherwise = myFilter p xs

main :: IO ()
main = do
    print(myFilter even [1,2,3,4,5,6,7,8,9,10])

-- 8
-- Napisz funkcję onlyEven, która przyjmuje listę liczb całkowitych i zwraca listę zawierającą tylko liczby parzyste.
onlyEven :: [Integer] -> [Integer]
onlyEven [] = []
onlyEven (x:xs)
  | even x    = x : onlyEven xs
  | otherwise = onlyEven xs

main :: IO ()
main = do
    print(onlyEven [1,2,3,4,5,6,7,8,9,10])

-- 9
-- Napisz funkcję doubleAll, która przyjmuje listę liczb całkowitych i zwraca listę, w której każda liczba jest podwojona.
doubleAll :: Num a => [a] -> [a]
doubleAll = map (* 2)

main :: IO ()
main = do
    print(doubleAll [1,2,3,4,5])

-- 10
-- Napisz funkcję sumOfDigits, która dla danej liczby całkowitej zwróci sumę jej cyfr.
sumOfDigits :: Integral a => a -> a
sumOfDigits n = go (abs n)
  where
    go 0 = 0
    go x = (x `mod` 10) + go (x `div` 10)

main :: IO ()
main = do
    print(sumOfDigits 125)