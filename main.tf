# Definimos el proveedor (AWS)
provider "aws" {
  region = var.region_aws
}

# Aquí definiremos el Bucket de S3 para tu currículum
resource "aws_s3_bucket" "mi_curriculum" {
  bucket = var.nombre_bucket
}

# Bloqueamos el acceso público a nivel de Bucket (Buenas prácticas de Seguridad)
resource "aws_s3_bucket_public_access_block" "seguridad_bucket" {
  bucket = aws_s3_bucket.mi_curriculum.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Creamos la tabla de DynamoDB para el contador
resource "aws_dynamodb_table" "contador_visitas" {
  name         = "VisitasTabla"
  billing_mode = "PAY_PER_REQUEST" # Solo pagas si alguien entra (Serverless)
  hash_key     = "id"            # Nuestra "Partition Key"

  attribute {
    name = "id"
    type = "S" # "S" significa String (Texto)
  }

  tags = {
    Name        = "ContadorVisitas"
    Environment = "Dev"
  }
}