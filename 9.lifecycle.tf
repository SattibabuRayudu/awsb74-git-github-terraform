resource "aws_s3_bucket" "bhavanidemo0001" {
  bucket        = "bhavanidemo100"
  force_destroy = true
  tags = {
    Name        = "bhavanidemo100"
    Environment = var.env
  }
}
