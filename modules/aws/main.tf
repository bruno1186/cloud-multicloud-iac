# Modulo AWS - provisionamento padronizado
# Provider: AWS

variable "aws_region" {
  description = "Regiao AWS de destino"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "bucket_name" {
  description = "Nome do bucket S3 a ser criado"
  type        = string
}

resource "aws_s3_bucket" "app_storage" {
  bucket = "${var.bucket_name}-${var.environment}"

  tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
    Project     = "cloud-multicloud-iac"
  }
}

resource "aws_s3_bucket_versioning" "app_storage_versioning" {
  bucket = aws_s3_bucket.app_storage.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "app_storage_sse" {
  bucket = aws_s3_bucket.app_storage.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

output "bucket_arn" {
  value = aws_s3_bucket.app_storage.arn
}
