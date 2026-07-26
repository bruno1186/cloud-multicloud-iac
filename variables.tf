variable "environment" {
  description = "Ambiente de implantacao"
  type        = string
  default     = "dev"
}

# AWS
variable "aws_region" {
  description = "Regiao AWS"
  type        = string
  default     = "us-east-1"
}

variable "enable_aws" {
  description = "Habilita provisionamento na AWS"
  type        = bool
  default     = false
}

# Azure
variable "azure_location" {
  description = "Regiao Azure"
  type        = string
  default     = "brazilsouth"
}

variable "enable_azure" {
  description = "Habilita provisionamento no Azure"
  type        = bool
  default     = false
}

# GCP
variable "gcp_project_id" {
  description = "ID do projeto GCP"
  type        = string
  default     = ""
}

variable "gcp_region" {
  description = "Regiao GCP"
  type        = string
  default     = "southamerica-east1"
}

variable "enable_gcp" {
  description = "Habilita provisionamento no GCP"
  type        = bool
  default     = false
}

# OCI
variable "oci_compartment_id" {
  description = "OCID do compartment OCI"
  type        = string
  default     = ""
}

variable "oci_region" {
  description = "Regiao OCI"
  type        = string
  default     = "sa-saopaulo-1"
}

variable "enable_oci" {
  description = "Habilita provisionamento na OCI"
  type        = bool
  default     = false
}
