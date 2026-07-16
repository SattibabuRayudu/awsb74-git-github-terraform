resource "aws_s3_bucket" "bhavanidemo0001" {
  bucket        = "bhavanidemo0001"
  force_destroy = true
  tags = {
    Name        = "bhavanidemo0001"
    Environment = var.env
  }
  lifecycle {
    create_before_destroy = true
  }
}
