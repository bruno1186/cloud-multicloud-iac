# Modulo OCI - provisionamento padronizado
# Provider: Oracle Cloud Infrastructure (oci)

variable "compartment_id" {
  description = "OCID do compartment onde os recursos serao criados"
  type        = string
}

variable "region" {
  description = "Regiao OCI de destino"
  type        = string
  default     = "sa-saopaulo-1"
}

variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "bucket_name" {
  description = "Nome do bucket Object Storage"
  type        = string
}

data "oci_objectstorage_namespace" "ns" {
  compartment_id = var.compartment_id
}

resource "oci_objectstorage_bucket" "app_storage" {
  compartment_id = var.compartment_id
  namespace      = data.oci_objectstorage_namespace.ns.namespace
  name           = "${var.bucket_name}-${var.environment}"
  access_type    = "NoPublicAccess"
  versioning     = "Enabled"

  freeform_tags = {
    environment = var.environment
    managed_by  = "terraform"
    project     = "cloud-multicloud-iac"
  }
}

output "bucket_name_output" {
  value = oci_objectstorage_bucket.app_storage.name
}
