## Criando a Virtual Private Network (VPC)
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

## Criando o Internet Gateway (IGW)
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.env_prefix}-igw"
  }
}

## Criando as Subnets
# Private Subnets
resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.env_prefix}-private-subnet-${count.index + 1}"
  }
}

# Public Subnets
resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = {
    Name = "${var.env_prefix}-public-subnet-${count.index + 1}"
  }
}

## Criando os NAT Gateway
resource "aws_nat_gateway" "this" {
  count = length(var.private_subnet_cidrs)
  allocation_id = aws_eip.nat_gateway[count.index].id
  subnet_id = aws_subnet.private_subnets[count.index].id
}

## Craindo o Elastic IP
resource "aws_eip" "nat_gateway" {
  domain = "vpc"
  count = length(var.private_subnet_cidrs)
  depends_on = [ aws_internet_gateway.this ]
}

## Criando o Route Table (RT)
# Route Table Publica
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
}

resource "aws_route" "internet_gateway" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = aws_route_table.public.id
  gateway_id = aws_internet_gateway.this.id
}

resource "aws_route_table_association" "public" {
  count = length(var.public_subnet_cidrs)
  subnet_id = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public.id
}

# Route Table privada
resource "aws_route_table" "private" {
  count = length(var.private_subnet_cidrs)
  vpc_id = aws_vpc.this.id
}

resource "aws_route" "nat_gateway" {
  count = length(var.private_subnet_cidrs)
  destination_cidr_block = "0.0.0.0/0"
  route_table_id = aws_route_table.private[count.index].id
  nat_gateway_id = aws_nat_gateway.this[count.index].id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnet_cidrs)
  subnet_id = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private.id
}
