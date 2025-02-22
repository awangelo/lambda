module DefinicaoECondicionais where

-- `let` define variaveis locais, pode ser usado dentro expressoes
-- Tem escopo na expressao que foi criada
foo :: (Ord a, Num a) => a -> a
foo x =
  if x > 10
    then
      let min = 2
       in x * min
    else
      let max = 5
       in x * max

-- `where` define variaveis locais, deve final de funcoes
-- Tem escopo de funcao
bar :: (Ord a, Num a) => a -> a
bar x =
  if x > 10
    then x * min
    else x * max
  where
    min = 2
    max = 5

-- exemplo de guards, a funcao pode ter multiplas condicoes
-- `otherwise` eh sempre o ultimo caso, ele eh apenas um `True`
baz :: (Ord a, Num a) => a -> a
baz x
  | x > 10 = x * min
  | otherwise = x * max
  where
    min = 2
    max = 5

-- A primeira condicao que for verdadeira vai ser executada
odeioZeros :: (Eq p, Num p) => p -> p -> p
odeioZeros 0 y = 0
odeioZeros x 0 = 0
odeioZeros x y = x * y

-- O `_` eh um wildcard pra ignorar valores
odeioZeros2 :: (Eq p, Num p) => p -> p -> p
odeioZeros2 0 _ = 0
odeioZeros2 _ 0 = 0
odeioZeros2 x y = x * y

-- Simplifique:
-- (&&&) :: Bool -> Bool -> Bool
-- True &&& True = True
-- True &&& False = False
-- False &&& True = False
-- False &&& False = False

(&&&) :: Bool -> Bool -> Bool
True &&& True = True
_ &&& _ = False