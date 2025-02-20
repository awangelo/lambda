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
