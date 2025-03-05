## Funcoes como tipos

`soma :: Int -> Int -> Int`

eh igual a:

`soma :: Int -> (Int -> Int)`

Ou seja, a funcao `soma` recebe um `Int` e retorna outra funcao que recebe um `Int` e retorna um `Int`.

```haskell
soma :: Int -> (Int -> Int)
soma x y = x+y

soma3 :: Int -> Int
soma3 = soma 3
-- > soma3 5
-- 8

dobra :: Int -> Int
dobra = (*2)
-- > dobra 5
-- 10
```

Esses exemplos mostram a aplicacao parcial, que cria uma nova funcao que espera os argumentos restantes. 

Parece com a currying e closures, pois a funcao recebe apenas um argumento e "lembra" do argumento anterior.

## Funcoes de alta ordem

Como podemos passar funcoes como argumentos e retornar funcoes, podemos criar funcoes que recebem funcoes como argumentos ou retornam funcoes.

```haskell
aplicaDuasVezes :: (a -> a) -> a -> a
aplicaDuasVezes f x = f (f x)
-- onde `f` eh uma funcao que recebe um argumento do mesmo tipo que ela retorna.

-- > aplicaDuasVezes (*2) 3
-- 12

-- Exemplo:
metade :: [a] -> [a]
metade xs = take (length xs `div` 2) xs

-- > aplicaDuasVezes metade [1..10]
-- [1,2]
```

### map

`map` eh uma funcao de alta ordem que aplica uma funcao a cada elemento de uma lista, similar ao list comprehension: `[f x | x <- xs]`

```haskell
map :: (a -> b) -> [a] -> [b]

-- > map (*2) [1..5]
-- [2,4,6,8,10]

-- > map even [1..5]
-- [False,True,False,True,False]
```

### filter

`filter` eh uma funcao de alta ordem que filtra os elementos de uma lista que satisfazem uma condicao, similar ao list comprehension: `[x | x <- xs, p x]`

```haskell
filter :: (a -> Bool) -> [a] -> [a]

-- > filter even [1..5]
-- [2,4]

-- > filter (>3) [1..5]
-- [4,5]
```

### all, any, takeWhile, dropWhile

```haskell
all :: (a -> Bool) -> [a] -> Bool
-- Retorna True se todos os elementos da lista satisfazem a condicao.
-- > all even [2,4,6]
-- True

any :: (a -> Bool) -> [a] -> Bool
-- Retorna True se algum elemento da lista satisfaz a condicao.
-- > any odd [2,4,6]
-- False

takeWhile :: (a -> Bool) -> [a] -> [a]
-- Retorna os elementos da lista enquanto a condicao for verdadeira.
-- > takeWhile even [8,4,2,3,6,11]
-- [8,4,2]

dropWhile :: (a -> Bool) -> [a] -> [a]
-- Remove os elementos da lista enquanto a condicao for verdadeira.
-- > dropWhile even [8,4,2,3,6,11]
-- [3,6,11]
```