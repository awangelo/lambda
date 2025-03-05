module Hanoi where

hanoi :: Int -> Char -> Char -> Char -> [(Int, Char, Char)]
hanoi 1 estacaInicio estacaFim _ = [(1, estacaInicio, estacaFim)]
hanoi n estacaInicio estacaFim estacaAux =
  hanoi (n - 1) estacaInicio estacaAux estacaFim
    ++ [(n, estacaInicio, estacaFim)]
    ++ hanoi (n - 1) estacaAux estacaFim estacaInicio

main :: IO ()
main = do
  print $ hanoi 5 'A' 'C' 'B'