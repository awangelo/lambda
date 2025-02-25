module Listas where
import qualified GHC.TypeLits as exceptions

-- https://hackage.haskell.org/package/base-4.21.0.0/docs/Data-List.html
-- https://wiki.haskell.org/How_to_work_on_lists
--
-- Listas sao `singly linked`, arrays comuns podem ser usados com:
-- https://hackage.haskell.org/package/vector-0.13.2.0/docs/Data-Vector.html

-- Listas em haskell sao construidas "recursivamente" usando o `cons` (:)
-- `(1 : 2 : 3 : [])` ou `1 : (2 : (3 : []))`
-- eh a mesma coisa de:
-- [1, 2, 3]

listaNormal = [1, 2, 3, 4, 5]

-- [1, 2, 3, 4, 5]

listaComRange = [1 .. 5]

-- [1, 2, 3, 4, 5]

listaComStep = [1, 3 .. 5]

-- [1, 3, 5]

listaInfinita = [1 ..]

-- [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19...
-- Os elementos ainda nao nescessarios sao `thunks`:
-- > A thunk is a value that is yet to be evaluated.
-- > A lazy run-time system does not evaluate a thunk unless it has to.

-- Tamanho da lista - O(N) 
length listaNormal
-- 5

-- Acessar index `n` - O(n)
-- Pode gerar exceptions.
listaNormal !! 4
-- 5
listaNormal !! 9
-- *** Exception: Prelude.!!: index too large

-- (!?) faz parte de Data.List.Safe (nao ta no Prelude)
listaNormal !? 4
-- Just 5
listaNormal !? 9
-- Nothing


-- (++) Concatenacao de duas listas - O(2n)?
listaNormal ++ listaNormal
-- [1, 2, 3, 4, 5, 1, 2, 3, 4, 5]

-- Acesso a elementos: 

-- Primeiro no - O(1)
head listaNormal
-- 1

-- Ultimo no O(N)
last listaNormal

-- Todos menos primeiro - O(1)
-- `tail` retorna apenas o segundo no da lista O(1)
-- (caso ela seja percorrida sera O(N)).
tail listaNormal
-- [2, 3, 4, 5]

-- Todos menos Ultimo - O(N)
init listaNormal
-- [1, 2, 3, 4]

-- Reverte uma lista finita - O(N)
reverse listaNormal
-- [5, 4, 3, 2, 1]


-- Esta presente na lista - O(N)
elem 3 listaNormal
-- 3 `elem` listaNormal
-- True

-- Retorna `n` primeiros elementos da lista
take 2 listaNormal
-- [1, 2]

-- Retorna a lista sem os primeiros `n` elem
drop 3 listaNormal
-- [4, 5]


-- EXERCICIOS:
-- O que a seguinte expressão retornará?
--
-- head (tail [0..10])

head [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
1

-- Implemente o operador !! utilizando as funções anteriores.

(!!) n xs = head (drop n xs)


-- PATTERN MATCHING:

-- Lista vazia:
--   []

-- Lista com um elemento:
--   (x : []) ou [x]

-- Lista com um elemento seguido de vários outros:
--   (x : xs)

-- Se o elemento nao for ser usado, `x` pode ser substituidos por ``