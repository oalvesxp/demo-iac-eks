## Criando Grupos de Segurança (Security Groups)
# SSH Cluster
resource "aws_security_group" "ssh_eks" {
  name   = "ssh_eks"
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.env_prefix}-ssh-eks-sg"
  }
}
