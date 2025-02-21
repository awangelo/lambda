module Main where

-- `a` deve implementar a classe especificada, ou seja,
-- `a` deve ser uma instancia de `Integral` por exemplo
-- `(Classe a) => a`
-- tamanho :: (Integral a) => [a] -> Int
--
-- No polimorfismo parametrico a funcao opera da mesma maneira para
-- qualquer tipo, ela nao se importa com a estrutura interna do tipo
tamanho :: [a] -> Int
tamanho [] = 0
tamanho (_ : xs) = 1 + tamanho xs

-- No polimorfismo ad-hoc a funcao pode se comportar de forma diferente
-- (de forma proposital ou nao). A implementacao de `mod` para diversos
-- tipos pode ser diferente, entao o `=>` denota que sera especificado
-- para tal classe (`Integral` neste caso).
impar :: (Integral a) => a -> Bool
impar x = x `mod` 2 == 1

quadrado :: (Num a) => a -> a
quadrado x = x * x

-- `Ord` é uma classe que define operações de comparação
-- `a` precisa ser ordenavel para usar `>`.
primeiroEhMaior :: (Num a, Ord a) => a -> a -> Bool
primeiroEhMaior x y = x > y

main :: IO ()
main = do
  print $ tamanho [1, 2, 3]
  print $ impar 2
  print $ quadrado 4
  print $ primeiroEhMaior 9 4
