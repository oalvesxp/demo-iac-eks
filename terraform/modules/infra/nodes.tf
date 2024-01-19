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

## Anexando a politica de 'EKS Worker' a role 'RoleForEKSGroupNodes'
resource "aws_iam_role_policy_attachment" "nodes_eks_worker_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role = aws_iam_role.nodes.name
}
