# Haskell
## Komentarze
```
-- Komentarz jednolinijkowy

{-
    To jest
    komentarz
    wielolinijkowy
-}
```

## Funkcje
```
addMe :: Integer -> Integer -> Integer
addMe x y = x + y

main :: IO ()
main = do
    putStr "Sum of x + y = "
    print (addMe 10 25)
```

## Listy
### Listy to jednorodne kolekcje elementów.

```
xs = [1,2,3,4,5]
head xs     -- 1
tail xs     -- [2,3,4,5]
length xs   -- 5
sum xs      -- 15
```
#### Zakresy i leniwość
```
[1..10]           -- [1,2,3,...,10]
[1,3..9]          -- [1,3,5,7,9]
take 5 [1..]      -- [1,2,3,4,5] (lista nieskończona)
```
#### Łączenie list
```
[1,2] ++ [3,4]         -- [1,2,3,4]
'a' : "bc"             -- "abc"
```
#### Dostęp do elementów
```
[1,2,3] !! 0           -- 1
[1,2,3] !! 2           -- 3
```
#### Listy wyrozumowane (list comprehensions)
```
[ <wyrażenie> | <zmienna> <- <lista>, <warunek1>, <warunek2>, ... ]

[x * 2 | x <- [1..5]]
-- Wynik: [2,4,6,8,10]

[x | x <- [1..10], even x]
-- Wynik: [2,4,6,8,10]

[(x, y) | x <- [1,2], y <- [3,4]]
-- Wynik: [(1,3),(1,4),(2,3),(2,4)]

take 5 [x^2 | x <- [1..]]
-- Wynik: [1,4,9,16,25]
```

## Funkcje Wyższego Rzędu (Higher-Order Functions)
### Przyjmuje inną funkcję jako argument lub zwraca funkcję jako wynik.
`map` stosuje daną funkcję do każdego elementu listy.
```
map (*2) [1,2,3]
-- Wynik: [2,4,6]
```

## Krotki (Tuples)
### Tuples przechowują stałą liczbę elementów różnych typów.
```
mojaKrotka :: (Int, String, Bool)
mojaKrotka = (1, "Haskell", True)

-- Dostęp do elementów krotki
-- fst (1, "Hello") -- zwróci 1
-- snd (1, "Hello") -- zwróci "Hello"
```
#### Krotki jako elementy list
```
[(1, "a"), (2, "b"), (3, "c")]

map fst [(1, "a"), (2, "b")]   -- [1,2]
map snd [(1, "a"), (2, "b")]   -- ["a","b"]
```

## Wzorce (Pattern matching)
### Wzorce pozwalają na definiowanie funkcji w zależności od struktury danych wejściowych.
`x` – reprezentuje pierwszy element listy (głowę),
`xs` – reprezentuje pozostałe elementy listy (ogon).
```
-- Funkcja obliczająca sumę elementów listy
sumList :: [Int] -> Int
sumList [] = 0                -- przypadek pustej listy
sumList (x:xs) = x + sumList xs  -- x to pierwszy element, xs to reszta listy
```
```
-- Przykład funkcji, która zwraca długość listy (bez użycia wbudowanej funkcji length)
dlugosc :: [a] -> Int
dlugosc [] = 0 -- Dla pustej listy, długość to 0
dlugosc (_:xs) = 1 + dlugosc xs -- Dla listy niepustej (głowa ignorowana, operujemy na ogonie)

-- Użycie:
-- dlugosc [1,2,3] -- zwróci 3
-- dlugosc []      -- zwróci 0
```

`\x -> x * 2` to funkcja anonimowa (lambda).

`filter` wybiera elementy z listy, które spełniają dany predykat (funkcję zwracającą `Bool`).
```
-- Przykład: wybierz tylko parzyste liczby z listy
tylkoParzyste :: [Int] -> [Int]
tylkoParzyste lista = filter (\x -> x `mod` 2 == 0) lista
-- lub krócej: tylkoParzyste = filter even

-- Użycie:
-- tylkoParzyste [1,2,3,4,5,6] -- zwróci [2,4,6]
```
`foldr` (reduce / right fold) "zwija" listę do pojedynczej wartości, stosując funkcję od prawej do lewej.
```
-- Przykład: suma elementów listy
sumaElementow :: [Int] -> Int
sumaElementow lista = foldr (+) 0 lista
--foldr (+) 0 [1,2,3] działa tak: 1 + (2 + (3 + 0))

-- Użycie:
-- sumaElementow [1,2,3] -- zwróci 6
```
`foldl` działa od lewej do prawej.

# Prolog
coming soon xd
