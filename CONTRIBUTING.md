# Contribuindo

Obrigado por considerar contribuir com este projeto.

## Como propor uma mudanca
1. Abra uma issue descrevendo o problema ou a melhoria antes de implementar mudancas maiores.
2. Crie uma branch a partir de main com um nome descritivo.
3. Rode terraform fmt -check e terraform validate antes de abrir o PR.
4. Abra um Pull Request explicando o que mudou e por que.
## Decisoes de arquitetura
Mudancas que alterem a forma como os providers sao ativados ou orquestrados devem ser registradas como ADR em docs/adr/.

## Padrao de codigo
Siga a convencao de nomes e a estrutura de modulos ja usada no projeto (um modulo por provider, flags enable_* em variables.tf).
