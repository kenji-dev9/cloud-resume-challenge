# Definimos el proveedor (AWS)
provider "aws" {
  region = "us-east-1" 
}

# Aquí definiremos el Bucket de S3 para tu currículum
resource "aws_s3_bucket" "mi_curriculum" {
  bucket = "tu-nombre-unico-de-bucket-2026" # Cámbialo por algo único
}