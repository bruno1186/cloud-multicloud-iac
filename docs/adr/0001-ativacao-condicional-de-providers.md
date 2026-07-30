# ADR 0001: Ativacao condicional de providers por flag

## Contexto
Nem todo time/projeto usa os quatro provedores de nuvem (AWS, Azure, GCP, OCI) ao mesmo tempo. Forcar a configuracao de todos os providers geraria atrito e erros de inicializacao desnecessarios.

## Decisao
Cada provider e ativado de forma independente via flags (enable_aws, enable_azure, enable_gcp, enable_oci) em variables.tf, com os modulos correspondentes orquestrados condicionalmente em main.tf.

## Consequencias
- Times habilitam apenas os provedores que realmente usam, reduzindo configuracao e superficie de erro.
- Padroes de tags, versionamento e criptografia sao mantidos consistentes entre os modulos habilitados.
- Novos providers podem ser adicionados seguindo o mesmo padrao de flag + modulo independente.
