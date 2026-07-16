resource "aws_s3_bucket" "bhavanidemo001" {
  bucket        = "bhavanidemo001"
  force_destroy = true
  tags = {
    Name        = "bhavanidemo001"
    Environment = var.env
  }
}
