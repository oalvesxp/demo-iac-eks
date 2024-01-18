## Criando Grupos de Segurança (Security Groups)
# SSH Cluster
resource "aws_security_group" "ssh_eks" {
  name   = "ssh_eks"
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.env_prefix}-ssh-eks-sg"
  }
}

# SSH Cluster - Regra de entrada (SSH Cluster Rule In)
resource "aws_security_group_rule" "ssh_eks_in" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"] # Enabled to any IP
  security_group_id = aws_security_group.ssh_eks.id
}

resource "aws_security_group_rule" "ssh_eks_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"] # Enabled to any IP
  security_group_id = aws_security_group.ssh_eks.id
}
