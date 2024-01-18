terraform {
  ################################################################
  ## Assumindo que o backend já foi configurado pelo ../backend
  ## se você não configurar o backend externo, haverá problemas 
  ## na execução deste env, veja ../backend/main.tf
  ################################################################
  backend "s3" {
    bucket          = "tf-state-831511089306-us-east-1"
    key             = "staging/terraform.tfstate"
    region          = "us-east-1"
    dynamodb_table  = "locking-831511089306-us-east-1"
    encrypt         = true
  }
}
