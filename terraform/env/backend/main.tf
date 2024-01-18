terraform {
  ################################################################
  ## Depois de rodar o 'terraform apply' (com o backend local)
  ## você precisa descomentar essa sessão e rodar o 'terraform init' novamente
  ## para trocar o backend local para o backend remoto
  ################################################################
  # backend "s3" {
  #   bucket          = "tf-state-831511089306-us-east-1"
  #   key             = "tf-backend/terraform.tfstate"
  #   region          = "us-east-1"
  #   dynamodb_table  = "locking-831511089306-us-east-1"
  #   encrypt         = true
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}

## Módulo de Backend externo
module "backend" {
  source = "../../modules/backend"
}
