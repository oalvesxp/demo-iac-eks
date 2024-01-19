## Criando os nodes para o cluster EKS
# Criando a role para o grupo de nodes
resource "aws_iam_role" "nodes" {
  name = "RoleForEKSGroupNodes"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}
