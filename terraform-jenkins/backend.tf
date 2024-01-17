terraform {
  # Configurando o backend externo na AWS
  backend "s3" {
    bucket         = "tf-state-831511089306-us-east-1"
    key            = "jenkins-server/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "locking-831511089306-us-east-1"
    encrypt        = true
  }
}