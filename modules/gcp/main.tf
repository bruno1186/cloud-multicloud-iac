# Modulo GCP - provisionamento padronizado
# Provider: Google Cloud (google)

variable "project_id" {
  description = "ID do projeto GCP"
  type        = string
}

variable "region" {
  description = "Regiao GCP de destino"
  type        = string
  default     = "southamerica-east1"
}

variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "bucket_name" {
  description = "Nome do bucket GCS (deve ser globalmente unico)"
  type        = string
}

resource "google_storage_bucket" "app_storage" {
  name          = "${var.bucket_name}-${var.environment}"
  project       = var.project_id
  location      = var.region
  force_destroy = false

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }

  labels = {
    environment = var.environment
    managed_by  = "terraform"
    project     = "cloud-multicloud-iac"
  }
}

output "bucket_url" {
  value = google_storage_bucket.app_storage.url
}
