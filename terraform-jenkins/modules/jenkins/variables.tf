## Variáveis da VPC
variable "vpc_cidr_block" {
  description = "CIDR Block da VPC"
  type        = string
}

variable "env_prefix" {
  description = "Prefixo do Environment"
  type        = string
}

variable "subnet_cidr_block" {
  description = "CIDR Block da subnet"
  type        = string
}

variable "azs" {
  description = "Zonas de disponibilidade"
  type        = list(string)
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]
}
