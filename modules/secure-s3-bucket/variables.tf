variable "bucket_name" {
  description = "Nombre base del bucket S3."
  type        = string
}

variable "environment" {
  description = "Entorno de despliegue (ej. dev, qa, prod)."
  type        = string
}

variable "tags" {
  description = "Etiquetas (tags) a aplicar al recurso para control de costos e inventario."
  type        = map(string)
  default     = {}
}