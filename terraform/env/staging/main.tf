## Módulo de Infraestrutura
module "infra" {
  source = "../../modules/infra"

  ## tfvars
  env_prefix = "staging"
  vpc_cidr   = "10.0.0.0/16"
}
