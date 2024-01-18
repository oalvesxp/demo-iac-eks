## Criando o Repositório ECR
resource "aws_ecr_repository" "this" {
  name         = var.env_prefix
  force_delete = true

  tags = {
    Name = "${var.env_prefix}-ecr"
    Env  = var.env_prefix
  }
}
