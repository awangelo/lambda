ZERO = \f \x -> x
UM = \f \x -> f x
DOIS = \f \x -> f (f x)
...

INC ZERO = UM
\f.\x.x = \f.\x.f x
-- ou
\f x -> x = \f x -> f x


-- `n` eh um numero de Church ()
-- `n` precisa de dois "argumentos" / precisa ser aplicado a algo
-- Por isso, `f x` sao passador para `n`
-- Se `n` fosse um valor nao seria nescessario utilizar `f x`

-- Ou seja,    estes \/\/ sao apenas para satisfazer a existencia de `n`
INC = \n f x -> f (n f x)
-- ou
INC = \n.\f.\x.f (n f x)

-- Incremento eh a mesma coisa que somar `n + 1`
-- que pode ser generalizado para `m + n`

-- `m` eh um numero de Church que requer dois argumentos, neste caso o `f` e `(n f x)`
-- esses dois      \/ \    /
SOMA \n m f x -> n f (m f x)
-- ou
SOMA \n.\m.\f.\x.n f (m f x)

-- Detalhe: poderia ser `\N M f x -> M f (N f x)` pois a ordem da adicao nao muda o resultado
