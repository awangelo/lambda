DUAS_VEZES = \f x -> f (f x)

INC = \n f x -> f (n f x)

-- ou
-- INC = \n.\f.\x.f (n f x)

-- λn.(λf.λx.f(fx)) ((λf.λx.f(fx))n)
SOMA_QUATRO = \n -> DUAS_VEZES (DUAS_VEZES n)

--              arg   segundo agr
--             \   / \         /
-- \n.\f.\x. f (f x) (f (f x) n)

-- SOMA_QUATRO = INC (INC DUAS_VEZES)
-- Incorreto (eh apenas o numero 4)

SOMA_DEZESSEIS = \n -> SOMA_QUATRO (SOMA_QUATRO (SOMA_QUATRO (SOMA_QUATRO n)))

1 . (\g -> g 5) (\x -> add x 3)

-- (\ x -> add x 3) 5
-- add 3 5
-- 8

2 . (\x -> (\y z -> z y) x) p (\x -> x)

-- (\p -> (\y z -> z y) p) (\x -> x)
-- (\y z -> z y) p (\x -> x)
-- (\y z -> z y) p (\x -> x)
-- (\x -> x) p
-- p
-- Identidade de `p`

3 . (\x -> x x x) (\x -> x x x)

-- (\x -> x x x) (\x -> x x x) (\x -> x x x)

4 . (\x -> \y -> (add x ((\x -> sub x 3) y))) 5 6

-- (\a -> \y -> (add a ((\x -> sub x 3) y))) 5 6
-- \y -> (add 5 ((\x -> sub x 3) y))) 6
-- add 5 ((\x -> sub x 3) 6)
-- add 5 (sub 6 3)
-- add 5 3
-- 8

-- DOIS = \f.\x.f (f x)
-- CINCO = \f.\x.f (f (f (f (f x))))
-- Aplicacao de dois numeros de Church = multiplicacao

5 . (\c -> c (\a -> \b -> b)) ((\a -> \b -> \f -> f a b) p q)

-- (\c -> c (\a -> \b -> b)) (\f -> f p q)
-- (\f -> f p q) (\a -> \b -> b))
-- (\a -> \b -> b) p q
-- q

let x = 5 in let y = (add x 3) in (mul x y)

-- mul 5 (add 5 3))
-- mul 5 8
-- 40

let a = 7 in let g = λx . (mul a x) in let a = 2 in (g 10)

-- (\a -> (\g -> (\a -> g 10) 2) (\x -> mul a x)) 7
-- (\g -> (\a -> g 10) 2) (\x -> mul 7 x)
-- (\a -> (\x -> mul 7 x) 10) 2
-- (\x -> mul 7 x) 10
-- mul 7 10
-- 70
