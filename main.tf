# Definimos el proveedor (AWS)
provider "aws" {
  region = "us-east-1" 
}

# Aquí definiremos el Bucket de S3 para tu currículum
resource "aws_s3_bucket" "mi_curriculum" {
  bucket = "tu-nombre-unico-de-bucket-2026" # Cámbialo por algo único
}

# Bloqueamos el acceso público a nivel de Bucket (Buenas prácticas de Seguridad)
resource "aws_s3_bucket_public_access_block" "seguridad_bucket" {
  bucket = aws_s3_bucket.mi_curriculum.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}