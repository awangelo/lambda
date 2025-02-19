o = (\x -> x x)
-- Dado um `x`, aplique `x` a ele mesmo
o I = I I = I
-- A imagem de `I` eh `I`

-- Aplicando `o` a ele mesmo criamos um ponto fixo:
-- um ponto fixo ou Fixed-point eh um valor que mapia para ele mesmo.
-- Assim criamos o O combinador (Omega)
OMEGA = o o
-- ou
OMEGA = (\x.x x) (\x.x x)

-- O omega repete apenas uma vez, ele eh so uma funcao que se chama a si mesma
-- Para criar um loop infinito (Y combinator) precisamos de uma funcao que seja o ponto fixo dela mesma
Y = \f -> (\x -> f (x x)) (\x -> f (x x))
-- ou
Y = \f.(\x.f (x x)) (\x.f (x x))

-- O `x` nao possui um valor fixo
-- Ele esta chamando a segunda funcao com ela mesma:
-- assim  \    essa     / \   usa essa  / como argumento
Y = \f -> (\x -> f (x x)) (\x -> f (x x))
