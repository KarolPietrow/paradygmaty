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

## Tuples (Krotki)
### Tuples przechowują stałą liczbę elementów różnych typów.
```
mojaKrotka :: (Int, String, Bool)
mojaKrotka = (1, "Haskell", True)

-- Dostęp do elementów krotki
-- fst (1, "Hello") -- zwróci 1
-- snd (1, "Hello") -- zwróci "Hello"
```

## Wzorce (Pattern matching)
### Wzorce pozwalają na definiowanie funkcji w zależności od struktury danych wejściowych.
```
-- Przykład funkcji, która zwraca długość listy (bez użycia wbudowanej funkcji length)
dlugosc :: [a] -> Int
dlugosc [] = 0 -- Dla pustej listy, długość to 0
dlugosc (_:xs) = 1 + dlugosc xs -- Dla listy niepustej (głowa ignorowana, operujemy na ogonie)

-- Użycie:
-- dlugosc [1,2,3] -- zwróci 3
-- dlugosc []      -- zwróci 0
```

## Funkcje Wyższego Rzędu (Higher-Order Functions)
### Funkcje wyższego rzędu mogą przyjmować inne funkcje jako argumenty lub zwracać je jako wyniki.
`map` stosuje daną funkcję do każdego elementu listy.
```
-- Przykład: pomnóż każdy element listy przez 2
pomnozPrzezDwa :: [Int] -> [Int]
pomnozPrzezDwa lista = map (\x -> x * 2) lista
-- lub krócej: pomnozPrzezDwa = map (*2)

-- Użycie:
-- pomnozPrzezDwa [1,2,3] -- zwróci [2,4,6]
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

## Moduły
### Haskell używa modułów do organizacji kodu. Możesz importować funkcje z innych modułów.
```
import Data.List -- Importuje moduł Data.List

-- Możesz teraz używać funkcji takich jak sort, nub (usuwa duplikaty) itp.
-- sort [3,1,2] -- zwróci [1,2,3]
```

# Prolog
coming soon xd
