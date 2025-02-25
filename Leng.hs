module Leng where

leng :: [Int] -> Int
leng [] = 0
leng (_ : xs) = 1 + leng xs

main :: IO ()
main = do
  print $ leng [1, 2, 3, 4, 5, 6, 7, 8]