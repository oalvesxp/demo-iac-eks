## Módulo de Infraestrutura
module "infra" {
  source = "../../modules/infra"

  ## tfvars
  env_prefix = "stating"
}
