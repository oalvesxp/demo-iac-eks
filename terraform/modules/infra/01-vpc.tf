## Criando a VPC (Virtual Private Cloud)
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    "Name" = "main"
    "Env"  = "${var.env_prefix}"
  }
}
