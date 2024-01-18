## Criando o IGW (Internet Gateway)
resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    "Name" = "igw"
    "Env"  = "${var.env_prefix}"
  }
}
