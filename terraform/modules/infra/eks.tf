## Criando o cluster EKS (Elastic Kubernetes Service)
resource "aws_iam_role" "cluster_policy" {
  name = "RoleForEKSClusterDemo"

  assume_role_policy = <<POLICY
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  }
  POLICY
}

resource "aws_iam_role_policy_attachment" "demo_eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.cluster_policy.name
}

resource "aws_eks_cluster" "demo" {
  name     = "${var.env_prefix}-demo"
  version  = "1.24"
  role_arn = aws_iam_role.cluster_policy.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.private[0].id,
      aws_subnet.private[1].id,
      aws_subnet.public[0].id,
      aws_subnet.public[1].id,
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.demo_eks_cluster_policy]
}
