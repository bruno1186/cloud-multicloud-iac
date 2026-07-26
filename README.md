# cloud-multicloud-iac

Infraestrutura como Codigo (Terraform) para provisionamento multi-cloud padronizado entre **AWS**, **Azure**, **GCP** e **OCI (Oracle Cloud Infrastructure)**.

## Objetivo

Fornecer modulos Terraform reutilizaveis e independentes por provedor, permitindo que times habilitem apenas os provedores necessarios em cada projeto, mantendo padroes de tags, versionamento e criptografia consistentes entre nuvens.

## Estrutura

- modules/aws - Bucket S3 com versionamento e criptografia server-side
- modules/azure - Resource Group + Storage Account
- modules/gcp - Bucket no Google Cloud Storage com versionamento
- modules/oci - Bucket no OCI Object Storage com versionamento
- providers.tf - Configuracao dos 4 providers (aws, azurerm, google, oci)
- variables.tf - Flags enable_aws / enable_azure / enable_gcp / enable_oci para ativar cada nuvem
- main.tf - Orquestracao condicional dos modulos

## Uso

```hcl
enable_aws   = true
aws_region   = "us-east-1"

enable_gcp      = true
gcp_project_id  = "meu-projeto"
```

```bash
terraform init
terraform plan
terraform apply
```

## CI

O workflow terraform-ci.yml roda automaticamente em cada push/PR: terraform fmt -check, terraform init -backend=false e terraform validate, garantindo qualidade e consistencia do codigo.

## Stack

Terraform, AWS, Azure, GCP, OCI, GitHub Actions
