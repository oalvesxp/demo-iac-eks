## Criando a Virtual Private Network (VPC)
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

## Criando as Subnets PrivadaS (Private Subnet)
resource "aws_subnet" "private_subnets" {
  count      = length(var.private_subnet_cidrs)
  vpc_id     = aws_vpc.this.id
  cidr_block = element(var.private_subnet_cidrs, count.index)

  tags = {
    Name = "private-subnet-${count.index + 1}"
  }
}
