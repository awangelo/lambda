# ferramentas

[Detalhes sobre um package](https://docs.haskellstack.org/en/stable/tutorial/package_description/)

- `<projeto>.cabal`: Arquivo de configuracao do projeto.
  - Nome e descricao do projeto.
  - Flags para o ghc.

- `stack.yaml`: Arquivo de configuracao do stack gerados pelo `stack init`
  - Versao do haskell.
  - Targets para buildar.
  - Configuracao de dependencias.
  - Configuracao de flags para build.

- `Setup.hs`: Arquivo para compatibilidade com o cabal.

## CLI

`stack run`: Roda o target principal do projeto.

`stack build`: Builda o o target principal do projeto.

`stack ghci`: Abre o repl interativo no projeto.

`runghc -Wall *.hs`: Roda um arquivo sozinho.

`ghc -Wall *.hs`: Builda um arquivo sozinho.
