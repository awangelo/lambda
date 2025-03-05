## Para uma solucao recursiva:

1. Identificar o caso base
    - O caso mais simples que pode ser resolvido diretamente.

2. Definir a relacao recursiva
    - Como o problema pode ser reduzido a um subproblema menor.

3. Garantir que a solucao converge para o caso base
    - Todas as chamadas recursivas devem chegar ao caso base.

## Convertendo para uma solucao com tail call:

1. Adcionar um acumulador
    - O acumulador vai armazenar os resultados parciais.

    - Geralmente, o acumulador eh a ultima operacao, ou seja, a que resolve o problema.

2. Reescrever a funcao para usar o acumulador
    - A chamada recursiva deve ser a ultima operacao.

    - Esta **incorreto**, o `*` eh a ultima operacao:
    ```haskell
    fat :: Integer -> Integer
    fat 0 = 1
    fat n = n * fat (n - 1) 
    ```
    
3. Esconder o acumulador
    - Criar uma funcao auxiliar que recebe o acumulador.


#### Correto:

```haskell
fatAux :: Integer -> Integer -> Integer -- Argumento a mais para o acumulador
fatAux 0 acc = acc
fatAux n acc = fatAux (n - 1) (n * acc) -- `n * acc` que "resolve" o problema

fat :: Integer -> Integer
fat n = fatAux n 1 -- Chama a func auxiliar com o acumulador
```

## Exercicios
