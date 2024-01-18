## Variáveis do Ambiente (Environment)
variable "env_prefix" {
  description = "Nome do ambiente"
  type        = string
}

## Variáveis da VPC (Virtual Private Cloud)
variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
}

variable "private_subnet_cidrs" {
  description = "CIDR das sub-redes privadas"
  type        = list(string)
}