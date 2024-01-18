## Módulo de Infraestrutura
module "infra" {
  source = "../../modules/infra"

  ## tfvars
  env_prefix           = "staging"
  vpc_cidr             = "10.0.0.0/16"
  private_subnet_cidrs = ["10.0.0.0/19", "10.0.32.0/19"]
  public_subnet_cidrs  = ["10.0.64.0/19", "10.0.96.0/19"]
  azs                  = ["us-east-1a", "us-east-1b"]
}
