## Criando o NAT (NAT Gateway)
# EIP (Elastic IP)
resource "aws_eip" "nat" {
  vpc = true

  tags = {
    "Name" = "nat"
  }
}

# NAT (NAT Gateway)
resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    "Name" = "nat"
  }

  depends_on = [aws_internet_gateway.this]
}
