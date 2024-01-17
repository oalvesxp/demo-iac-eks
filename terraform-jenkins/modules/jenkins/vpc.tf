## Criando a VPC
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

## Criando a Subnet
resource "aws_subnet" "this" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.azs[0]

  tags = {
    Name = "${var.env_prefix}-subnet-1"
  }
}

## Criando o Internet Gateway
resource "aws_internet_gateway" "this" {
  vpc_id = aws_subnet.this.id

  tags = {
    Name = "${var.env_prefix}-igw"
  }
}

## Criando a Route Table para VPC
resource "aws_default_route_table" "this" {
  default_route_table_id = aws_vpc.this.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.env_prefix}-rtb"
  }
}
