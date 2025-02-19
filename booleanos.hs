TRUE  = \x y -> x -- primeiro argumento
-- TRUE  = \x.\y.x
FALSE = \x y -> y -- segundo argumento
-- FALSE = \x.\y.y

-- `b` eh um booleano que escolher `x` se for `TRUE` e `y` se for `FALSE`
IF = \b x y -> b x y
-- IF = \b.\x.\y.b x y

-- O not apenas inverte os argumentos
NOT = \b -> b FALSE TRUE
-- NOT = \b.b \x.\y.y \x.\y.x

-- Se o primeiro for verdadeiro retorna o segundo (`TRUE`), nao precisa avaliar o segundo
-- Se o primeiro for falso, retorna o terceiro (`b`), que ja vai ser `TRUE` ou `FALSE`
OR = \a b -> a TRUE b
-- ou retornando o propio primeiro:
OR \a.\b.a a b

-- escolhe o segundo:  \  /
-- TRUE FALSE -> TRUE (TRUE FALSE)
--
-- escolhe o terceiro:        \  /
-- FALSE TRUE -> FALSE (FALSE TRUE)

AND = \a b -> a b a
-- AND = \a.\b.a b a
--
-- O primeiro `TRUE` escolhe o primeiro argumento
-- nesse caso:        \esse/
-- TRUE FALSE -> TRUE FALSE TRUE
--
-- O primeiro `FALSE` escolhe o segundo argumento
-- nesse caso:              \esse/
-- FALSE TRUE -> FALSE TRUE FLASE
