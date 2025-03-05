# Definicao

[expressao | variavel <- lista, condicao]

- `variavel <- lista`: Eh o gerador, alimenta a expressao com os elementos da lista.
- `expressao`: Define como cada elemento será processado.
- `condicao` (opcional): Filtra os elementos que serão incluídos na lista final.

## Exemplo:
```haskell
[toLower c | c <- "OLA MUNDO"]
-- "ola mundo"

[(x, even x) | x <- [1,2,3]]
-- [(1,False),(2,True),(3,False)]

[x | x <- [1..10] | odd x ]
-- [1,3,5,7,9]
```

Pode ser usado com mais de um gerador:
```haskell
[(x,y) | x <- [1,2,3], y <- [4,5]]
-- [(1,4),(1,5),(2,4),(2,5),(3,4),(3,5)]

[(x,y) | y <- [4..5], x <- [1..4]]
-- [(1,4),(2,4),(3,4),(4,4),(1,5),(2,5),(3,5),(4,5)]

[(i,j) | i <- [1..5], j <- [i+1..5]]
-- [(1,2), (1,3), (1,4), (1,5), (2,3), (2,4), (2,5)]
```

### Defina a função length utilizando compreensão de listas!
### Dica, você pode somar uma lista de 1s do mesmo tamanho da sua lista.

```haskell
meuLength xs = sum [ 1 | _ <- xs ]
-- Cria uma lista com um numero `1` para cada `x` (ou `_`)
meuLength [10,9..2]
-- sum [1,1,1,1,1,1,1,1,1]
-- 9
```

## Exercicios

### Defina uma funcao que retorna uma lista com os numeros primos
### Dica: primeiro criar uma funcao que retorna os divisores de um numero
### Dica: depois criar uma funcao que verifica se um numero eh primo

```haskell
divisores :: Int -> [Int]
divisores n = [x | x <- [1..n], n `mod` x == 0]

ehPrimo :: Int -> Bool
ehPrimo n = divisores n == [1, n]

todosPrimos :: [Int]
todosPrimos = [x | x <- [1..], ehPrimo x]
```

### Utilizando a função `pairs` defina a função sorted que retorna verdadeiro se uma lista está ordenada.
### Utilize também a função `and` que retorna verdadeiro se todos os elementos da lista forem verdadeiros.

```haskell
pairs :: [a] -> [(a,a)]
pairs xs = zip xs (tail xs)

and :: [Bool] -> Bool
and []        = True
and (True:xs) = and xs
and _         = False

sorted :: (Ord a) => [a] -> Bool
sorted xs = and [x <= y | (x, y) <- pairs xs]
```

### Crie uma função recursiva chamada `insert` que insere um valor `x`
### em uma lista `ys` ordenada de tal forma a mantê-la ordenada:

```haskell
insert :: (Ord a) => a -> [a] -> [a]
insert x [] = [x]
insert x (y:ys)
  | x <= y    = x:y:ys
  | otherwise = insert x ys
```

### Crie uma função recursiva chamada `isort` que utiliza a função `insert` para implementar o Insertion Sort:

```haskell
isort :: Ord a => [a] -> [a]
isort [] = []
isort (x:xs) = insert x (isort xs)
```

### Complete a função qsort que implementa o algoritmo Quicksort:

```haskell
qsort :: (Ord a) => [a] -> [a]
qsort []     = []
qsort (x:xs) = qsort menores ++ [x] ++ qsort maiores
  where
    menores = [a | a <- xs | a < x ]
    maiores = [b | b <- xs | b >= x ]
```

### Vamos considerar a função drop que remove os n primeiros elementos de uma lista:
> drop 3 [1..10]

> [4,5,6,7,8,9,10]

```haskell
drop' :: (Integral a) => a -> [b] -> [b]
drop' _ []     = []
drop' 0 xs     = xs
drop' n (_:xs) = drop (n-1) xs
```

### Faça uma versão que utilize uma variável acumuladora.
```haskell
hanoi :: Int -> Char -> Char -> Char -> [(Int, Char, Char)]
hanoi 1 estacaInicio estacaFim _ = [(1, estacaInicio, estacaFim)]
hanoi n estacaInicio estacaFim estacaAux =
  hanoi (n - 1) estacaInicio estacaAux estacaFim
    ++ [(n, estacaInicio, estacaFim)]
    ++ hanoi (n - 1) estacaAux estacaFim estacaInicio
```
Arquivo esta em: [Hanoi.hs](./Hanoi.hs)
