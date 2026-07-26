# Orquestracao dos modulos multi-cloud
# Cada modulo e habilitado de forma independente via variaveis enable_*

module "aws_storage" {
  source = "./modules/aws"
  count  = var.enable_aws ? 1 : 0

  aws_region  = var.aws_region
  environment = var.environment
  bucket_name = "bruno1186-app"
}

module "azure_storage" {
  source = "./modules/azure"
  count  = var.enable_azure ? 1 : 0

  location              = var.azure_location
  environment           = var.environment
  resource_group_name   = "bruno1186-rg"
  storage_account_name  = "bruno1186app"
}

module "gcp_storage" {
  source = "./modules/gcp"
  count  = var.enable_gcp ? 1 : 0

  project_id  = var.gcp_project_id
  region      = var.gcp_region
  environment = var.environment
  bucket_name = "bruno1186-app"
}

module "oci_storage" {
  source = "./modules/oci"
  count  = var.enable_oci ? 1 : 0

  compartment_id = var.oci_compartment_id
  region         = var.oci_region
  environment    = var.environment
  bucket_name    = "bruno1186-app"
}
