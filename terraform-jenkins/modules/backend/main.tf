## Criando o bucket para o Backend externo "*.tfstate"
resource "aws_s3_bucket" "this" {
  bucket = var.bucke_name
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
