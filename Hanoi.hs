module Hanoi where

hanoiAux :: Int -> Char -> Char -> Char -> [(Int, Char, Char)] -> [(Int, Char, Char)]
hanoiAux 1 estacaInicio estacaFim _ acc = (1, estacaInicio, estacaFim) : acc
hanoiAux n estacaInicio estacaFim estacaAux acc =
  hanoiAux (n - 1) estacaInicio estacaAux estacaFim $
    (n, estacaInicio, estacaFim)
      : hanoiAux (n - 1) estacaAux estacaFim estacaInicio acc

hanoi :: Int -> Char -> Char -> Char -> [(Int, Char, Char)]
hanoi n a b c = hanoiAux n a b c []

main :: IO ()
main = do
  print $ hanoi 3 'A' 'B' 'C'