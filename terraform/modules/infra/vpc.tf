## Criando a VPC (Virtual Private Cloud)
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

## Criando o IGW (Internet Gateway)
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

## Criando as Sub-redes (Subnets)
## Sub-redes Privadas (Private)
resource "aws_subnet" "private" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.env_prefix}-private-subnet-${count.index + 1}"
  }
}

# Sub-redes Públicas (Public)
resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.env_prefix}-public-subnet-${count.index + 1}"
  }
}

## Criando o NGW (NAT Gateway)
# EIP (Elastic IP)
resource "aws_eip" "nat_gateway" {
  count      = length(var.private_subnet_cidrs)
  depends_on = [aws_internet_gateway.this]

  tags = {
    Name = "${var.env_prefix}-eip-ngw-${count.index + 1}"
  }
}
