terraform {
  ################################################################
  ## Assumindo que o Bucket S3 e a tabela DynamoDB já foram configuradas
  ## See ../../modules/main.tf
  ################################################################
  backend "s3" {
    bucket         = "tf-state-831511089306-us-east-1"
    key            = "tf-staging/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "locking-831511089306-us-east-1"
    encrypt        = true
  }
}