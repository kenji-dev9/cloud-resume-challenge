variable "region_aws" {
  description = "Región donde se desplegará la infraestructura"
  default     = "us-east-1"
}

variable "nombre_bucket" {
  description = "Nombre único para el bucket de S3"
  default     = "tu-nombre-unico-de-bucket-2026" # Cámbialo por el tuyo
}