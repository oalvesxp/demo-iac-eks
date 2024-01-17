## Variáveis do Bucket S3
variable "bucke_name" {
  description = "Nome do bucket de Backend externo"
  type = string
  default = "tf-state-831511089306-us-east-1"
}

## Variáveis do DynamoDB
variable "table_name" {
  description = "Nome da tabela de Locks"
  type = string
  default = "locking-831511089306-us-east-1"
}
