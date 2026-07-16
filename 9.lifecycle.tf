resource "aws_s3_bucket" "bhavanidemo01" {
  bucket        = "bhavanidemo01"
  force_destroy = true
  tags = {
    Name        = "bhavanidemo01"
    Environment = var.env
  }
}
