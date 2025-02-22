module Listas where

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

-- Exemplos com operacoes simples:

-- Acessar index `n` - O(n)
-- listaNormal !! 4
-- 5
