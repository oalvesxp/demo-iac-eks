module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name                    = var.cluster_name
  cluster_version                 = "1.21"
  cluster_endpoint_private_access = true

  vpc_id     = aws_vpc.this.id
  subnet_ids = aws_subnet.private[*].id

  eks_managed_node_groups = {
    staging = {
      min_size               = 1
      max_size               = 10
      desired_size           = 3
      vpc_security_group_ids = [aws_security_group.ssh_eks.id]
      instance_type          = ["t2.micro"]
    }
  }
}
