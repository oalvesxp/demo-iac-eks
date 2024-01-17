## Variáveis da Virtual Private Network (VPC)
variable "vpc_cidr" {
  description = "Valor do CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Valores CIDR da subnet pública"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Valores CIDR da subnet privada"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "azs" {
  description = "Zonas de Disponibilidade (AZ's)"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

## Variáveis do Environment
variable "env_prefix" {
  description = "Prefixo do Environment"
  type        = string
}
