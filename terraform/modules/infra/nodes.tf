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

# Anexando a politica de 'EKS Worker' a role 'RoleForEKSGroupNodes'
resource "aws_iam_role_policy_attachment" "nodes_eks_worker_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.nodes.name
}

# Anexando a politica de 'EKS CNI' a role 'RoleForEKSGroupNodes'
resource "aws_iam_role_policy_attachment" "nodes_eks_cni_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.nodes.name
}

# Anexando a politica de 'AmazonEC2ContainerRegistryReadOnly' a role 'RoleForEKSGroupNodes'
resource "aws_iam_role_policy_attachment" "nodes_ec2_container_registry_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.nodes.name
}

# Anexando a politica de 'AmazonSSMManagedInstanceCore' a role 'RoleForEKSGroupNodes'
resource "aws_iam_role_policy_attachment" "nodes_ssm_managed_instance_core" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.nodes.name
}
