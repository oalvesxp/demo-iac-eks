## Variáveis da VPC
variable "vpc_cidr_block" {
  description = "CIDR Block da VPC"
  type        = string
}

variable "env_prefix" {
  description = "Prefixo do Environment"
  type        = string
}
