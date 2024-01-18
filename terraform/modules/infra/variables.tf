## Variáveis do Environment
variable "env_prefix" {
  description = "Nome do ambiente"
  type        = string
}

## Variáveis da VPC (Virtual Private Cloud)
variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
}

## Variáveis das Sub-redes (Subnets)
variable "private_subnet_cidrs" {
  description = "CIDR das Sub-redes privadas"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "CIDR das Sub-redes privadas"
  type        = list(string)
}

variable "azs" {
  description = "Zonas de disponibilidade (AZ's)"
  type        = list(string)
}